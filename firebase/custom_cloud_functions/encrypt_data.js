const { onCall, HttpsError } = require("firebase-functions/v2/https");
const crypto = require("crypto");
const { SecretManagerServiceClient } = require("@google-cloud/secret-manager");

const secretManagerClient = new SecretManagerServiceClient();
const secretName =
  "projects/12166217223/secrets/ENCRYPTION_KEY/versions/latest";
let cachedEncryptionKey;
const IV_LENGTH = 16;
// inicia a função
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
// verefica e se o usuario tem o token com vereficação SDK
exports.encryptData = onCall(async (request) => {
  if (!request.auth || request.auth.token.isADM !== true) {
    throw new HttpsError(
      "permission-denied",
      "Apenas administradores podem executar esta operação.",
    );
  }

  try {
    const textToEncrypt = request.data.text;
    if (!textToEncrypt || typeof textToEncrypt !== "string") {
      throw new HttpsError(
        "invalid-argument",
        'A função precisa de ser chamada com um argumento "text" do tipo string.',
      );
    }
    //inica a criptografia aes-256-cbc
    const encryptionKey = await getEncryptionKey();
    const iv = crypto.randomBytes(IV_LENGTH);
    const cipher = crypto.createCipheriv(
      "aes-256-cbc",
      Buffer.from(encryptionKey, "hex"),
      iv,
    );

    let encrypted = cipher.update(textToEncrypt);
    encrypted = Buffer.concat([encrypted, cipher.final()]);

    return {
      encryptedData: iv.toString("hex") + ":" + encrypted.toString("hex"),
    };
  } catch (error) {
    console.error(
      `Falha na criptografia para o administrador ${request.auth ? request.auth.uid : "desconhecido"}:`,
      error,
    );
    if (error instanceof HttpsError) {
      throw error;
    }
    throw new HttpsError(
      "internal",
      "Ocorreu um erro inesperado durante a criptografia.",
    );
  }
});
