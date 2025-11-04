/**
 * Marca todas as notificações não lidas de um usuário como lidas.
 */
exports.marcarNotificacoesComoLidas = onCall(async (request) => {
  // 1. Segurança: Garante que um usuário está logado.
  if (!request.auth) {
    throw new HttpsError(
      "unauthenticated",
      "A função precisa ser chamada por um usuário autenticado.",
    );
  }

  const uid = request.auth.uid;
  const notificacoesRef = admin.firestore().collection("notificacoes");

  try {
    // 2. Busca todas as notificações NÃO LIDAS destinadas ao usuário atual.
    const querySnapshot = await notificacoesRef
      .where("destinatarioUid", "==", uid)
      .where("lida", "==", false)
      .get();

    // Se não houver notificações para atualizar, termina aqui.
    if (querySnapshot.empty) {
      return {
        status: "noop",
        message: "Nenhuma notificação nova para marcar como lida.",
      };
    }

    // 3. Usa um "Batch Write" para atualizar todos os documentos de uma vez.
    const batch = admin.firestore().batch();
    querySnapshot.forEach((doc) => {
      batch.update(doc.ref, { lida: true });
    });

    // 4. Envia o lote de atualizações para o banco de dados.
    await batch.commit();

    return {
      status: "success",
      message: `${querySnapshot.size} notificações marcadas como lidas.`,
    };
  } catch (error) {
    console.error(
      `Erro ao marcar notificações como lidas para o usuário ${uid}:`,
      error,
    );
    throw new HttpsError("internal", "Ocorreu um erro inesperado no servidor.");
  }
});
