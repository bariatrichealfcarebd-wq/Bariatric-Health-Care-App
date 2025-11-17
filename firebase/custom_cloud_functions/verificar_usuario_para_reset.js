const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
exports.verificarUsuarioParaReset = onCall(async (request) => {
  // 1. Recebe os dados do app
  const { email, cpf } = request.data;
  if (!email || !cpf) {
    throw new HttpsError("invalid-argument", "Email e CPF são obrigatórios.");
  }

  try {
    // 2. Encontra o usuário no Firebase Auth
    const userRecord = await admin.auth().getUserByEmail(email);

    // 3. Encontra o usuário no Firestore
    const userDoc = await db.collection("Paciente").doc(userRecord.uid).get();
    if (!userDoc.exists) {
      throw new HttpsError(
        "not-found",
        "Usuário não encontrado no banco de dados.",
      );
    }

    const encryptedCpf = userDoc.data().CPF;
    if (!encryptedCpf) {
      throw new HttpsError("internal", "Usuário não possui CPF cadastrado.");
    }

    // 4. Descriptografa o CPF
    // (Isso assume que sua função decryptData está disponível)
    const decryptedCpf = await decryptData(encryptedCpf);

    // 5. Compara os CPFs
    if (decryptedCpf === cpf) {
      // SUCESSO! Os dados batem.
      return { status: "success", message: "Verificação concluída." };
    } else {
      // Erro: O CPF está incorreto
      throw new HttpsError(
        "invalid-argument",
        "O CPF não confere com este email.",
      );
    }
  } catch (error) {
    // Trata erros (ex: "user-not-found" do Auth, ou o erro do CPF)
    if (error.code === "auth/user-not-found") {
      throw new HttpsError("not-found", "Email não cadastrado.");
    }
    // Repassa o erro (ex: "O CPF não confere...")
    throw error;
  }
});

// (Função auxiliar - coloque isso no mesmo arquivo ou importe)
// Esta é a sua lógica de descriptografia, necessária aqui.
async function decryptData(encryptedText) {
  const encryptionKey = await getEncryptionKey(); // Pega a chave (do seu encryption.js)
  const textParts = encryptedText.split(":");
  const iv = Buffer.from(textParts.shift(), "hex");
  const encryptedData = Buffer.from(textParts.join(":"), "hex");
  const decipher = crypto.createDecipheriv(
    "aes-256-cbc",
    Buffer.from(encryptionKey, "hex"),
    iv,
  );
  let decrypted = decipher.update(encryptedData);
  decrypted = Buffer.concat([decrypted, decipher.final()]);
  return decrypted.toString();
}
