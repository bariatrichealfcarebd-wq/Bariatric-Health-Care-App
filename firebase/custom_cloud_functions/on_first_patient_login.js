// inicia protocolos de segurança
const { onCall, HttpsError } = require("firebase-functions/v2/https");
const admin = require("firebase-admin");

if (admin.apps.length === 0) admin.initializeApp();
// inicia função de notificação de primeiro acesso
exports.onFirstPatientLogin = onCall(async (request) => {
  if (!request.auth)
    throw new HttpsError(
      "unauthenticated",
      "A função precisa ser chamada por um usuário autenticado.",
    );

  const pacienteUid = request.auth.uid;
  const pacienteDocRef = admin.firestore().collection("users").doc(pacienteUid);
  // verefica se o paciente existe
  try {
    const pacienteDoc = await pacienteDocRef.get();
    if (!pacienteDoc.exists())
      throw new HttpsError(
        "not-found",
        "Documento do paciente não encontrado.",
      );

    const jaProcessado = pacienteDoc.data().primeiroLoginProcessado;
    // verefica se é o primeiro acesso do usuário
    if (jaProcessado === false) {
      const linkDoc = await admin
        .firestore()
        .collection("Nutri_Paciente")
        .doc(pacienteUid)
        .get();
      if (linkDoc.exists()) {
        const nutriUid = linkDoc.data().uid_Nutri;
        const nomePaciente = pacienteDoc.data().Nome;
        const notificacaoPayload = {
          destinatarioUid: nutriUid,
          remetenteUid: pacienteUid,
          mensagem: `Seu paciente, ${nomePaciente}, acessou a conta pela primeira vez.`,
          tipo: "PRIMEIRO_LOGIN",
          lida: false,
          data: admin.firestore.FieldValue.serverTimestamp(),
        };
        await admin
          .firestore()
          .collection("notificacoes")
          .add(notificacaoPayload);
      }
      //gera a notificação para o nutricionista
      await pacienteDocRef.update({ primeiroLoginProcessado: true });
      return {
        status: "success",
        message: "Primeiro login processado e notificação enviada.",
      };
    } else {
      return { status: "noop", message: "Nenhuma ação necessária." };
    }
  } catch (error) {
    console.error(
      `Erro ao processar o primeiro login para ${pacienteUid}:`,
      error,
    );
    throw new HttpsError("internal", "Ocorreu um erro inesperado no servidor.");
  }
});
