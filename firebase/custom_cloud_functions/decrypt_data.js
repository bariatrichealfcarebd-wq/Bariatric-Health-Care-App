const { onCall, HttpsError } = require("firebase-functions/v2/https");
const crypto = require("crypto");
const { SecretManagerServiceClient } = require("@google-cloud/secret-manager");

const secretManagerClient = new SecretManagerServiceClient();
const secretName =
  "projects/12166217223/secrets/ENCRYPTION_KEY/versions/latest";
let cachedEncryptionKey;
const IV_LENGTH = 16;

async function getEncryptionKey() {
  if (cachedEncryptionKey) return cachedEncryptionKey;
  try {
    const [version] = await secretManagerClient.accessSecretVersion({
      name: secretName,
    });
    const key = version.payload.data.toString("utf8");
    cachedEncryptionKey = key;
    return key;
  } catch (error) {
    console.error(
      "ERRO FATAL: Não foi possível aceder à chave de criptografia.",
      error,
    );
    throw new HttpsError("internal", "Erro de configuração do servidor.");
  }
}

exports.decryptData = onCall(async (request) => {
  if (!request.auth || request.auth.token.isADM !== true) {
    throw new HttpsError(
      "permission-denied",
      "Apenas administradores podem executar esta operação.",
    );
  }

  try {
    const encryptedData = request.data.encryptedData;
    if (!encryptedData || typeof encryptedData !== "string") {
      throw new HttpsError(
        "invalid-argument",
        'A função precisa de ser chamada com um argumento "encryptedData".',
      );
    }

    const parts = encryptedData.split(":");
    if (parts.length !== 2) {
      throw new HttpsError(
        "invalid-argument",
        "O formato dos dados criptografados está incorreto.",
      );
    }

    const iv = Buffer.from(parts.shift(), "hex");
    const encryptedText = Buffer.from(parts.join(":"), "hex");

    if (iv.length !== IV_LENGTH) {
      throw new HttpsError(
        "invalid-argument",
        "O vetor de inicialização (IV) tem o tamanho incorreto.",
      );
    }

    const encryptionKey = await getEncryptionKey();
    const decipher = crypto.createDecipheriv(
      "aes-256-cbc",
      Buffer.from(encryptionKey, "hex"),
      iv,
    );

    let decrypted = decipher.update(encryptedText);
    decrypted = Buffer.concat([decrypted, decipher.final()]);

    return { decryptedData: decrypted.toString() };
  } catch (error) {
    console.error(
      `Falha na descriptografia para o administrador ${request.auth ? request.auth.uid : "desconhecido"}:`,
      error,
    );
    if (error instanceof HttpsError) {
      throw error;
    }
    throw new HttpsError(
      "internal",
      "Ocorreu um erro inesperado durante a descriptografia.",
    );
  }
});
