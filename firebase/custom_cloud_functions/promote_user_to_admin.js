const { onCall, HttpsError } = require("firebase-functions/v2/https");
const admin = require("firebase-admin");

if (admin.apps.length === 0) {
  admin.initializeApp();
}

exports.promoteUserToAdmin = onCall(async (request) => {
  if (!request.auth || request.auth.token.isADM !== true) {
    throw new HttpsError(
      "permission-denied",
      "Apenas administradores podem promover outros utilizadores.",
    );
  }

  const uidToPromote = request.data.uid;
  if (!uidToPromote || typeof uidToPromote !== "string") {
    throw new HttpsError(
      "invalid-argument",
      "O UID do utilizador a ser promovido é obrigatório.",
    );
  }

  try {
    await admin.auth().setCustomUserClaims(uidToPromote, { isADM: true });
    await admin
      .firestore()
      .collection("Paciente")
      .doc(uidToPromote)
      .update({ isADM: true });
    return {
      message: `Sucesso! O utilizador ${uidToPromote} agora é um administrador.`,
    };
  } catch (error) {
    console.error("Erro ao promover utilizador a administrador:", error);
    throw new HttpsError(
      "internal",
      "Ocorreu um erro ao promover o utilizador.",
    );
  }
});
