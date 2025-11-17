/**
 * Envia uma notificação genérica, validando o tipo e o remetente.
 */
exports.enviarNotificacaoGenerica = onCall(async (request) => {
  // Requisito básico: autenticação
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Função requer autenticação.");
  }

  const { destinatarioUid, titulo, mensagem, tipo } = request.data;
  const remetenteUid = request.auth.uid;
  const remetenteIsADM = request.auth.token.isADM || request.auth.token.admLess; // Presumindo que Nutricionistas são ADM ou ADMless

  // 1. Validação de Argumentos
  if (!destinatarioUid || !mensagem || !tipo) {
    throw new HttpsError("invalid-argument", "Campos obrigatórios ausentes.");
  }

  // 2. Regras de Geração (Quem pode gerar o quê)
  const tiposExclusivosDoNutri = [
    "OUTRAS_SUPLEMENTACOES",
    "SUPLEMENTACAO_CUTANEA",
    "SUPLEMENTACAO_DIARIA",
    "RECOMENDACOES_ALIMENTARES",
  ];
  const tipoExclusivoDoPaciente = "QUESTIONARIO_ENVIADO";

  if (tiposExclusivosDoNutri.includes(tipo) && !remetenteIsADM) {
    throw new HttpsError(
      "permission-denied",
      `Apenas Nutricionistas podem gerar notificações do tipo ${tipo}.`,
    );
  }

  if (tipo === tipoExclusivoDoPaciente && remetenteIsADM) {
    throw new HttpsError(
      "permission-denied",
      "Apenas Pacientes podem gerar a notificação de QUESTIONARIO_ENVIADO.",
    );
  }

  // 3. Determinar o Destinatário Final
  let finalDestinatarioUid = destinatarioUid;
  let destinatarioColecao = "Paciente"; // Padrão é notificar o Paciente

  if (tipo === tipoExclusivoDoPaciente) {
    // Se for um questionário, o Paciente (remetente) notifica o Nutricionista (destinatário).
    // Precisamos encontrar o UID do Nutricionista vinculado.
    const linkDoc = await admin
      .firestore()
      .collection("Nutri_Paciente")
      .doc(remetenteUid)
      .get();
    if (!linkDoc.exists) {
      throw new HttpsError(
        "not-found",
        "Vínculo Nutri-Paciente não encontrado para este questionário.",
      );
    }
    finalDestinatarioUid = linkDoc.data().uid_Nutri;
    destinatarioColecao = "Paciente"; // O nutricionista também está na coleção 'Paciente'
  }

  try {
    // 4. Opcional: Verifica se o destinatário final existe.
    const destinatarioDoc = await admin
      .firestore()
      .collection(destinatarioColecao)
      .doc(finalDestinatarioUid)
      .get();
    if (!destinatarioDoc.exists) {
      return { status: "noop", message: "Destinatário final não encontrado." };
    }

    // 5. Monta e Salva o Payload
    const notificacaoPayload = {
      destinatarioUid: finalDestinatarioUid,
      remetenteUid: remetenteUid,
      titulo: titulo || "Aviso Importante",
      mensagem: mensagem,
      tipo: tipo,
      lida: false,
      data: admin.firestore.FieldValue.serverTimestamp(),
    };

    const docRef = await admin
      .firestore()
      .collection("notificacoes")
      .add(notificacaoPayload);

    return {
      status: "success",
      message: `Notificação do tipo ${tipo} enviada com sucesso.`,
      notificacaoId: docRef.id,
    };
  } catch (error) {
    console.error(
      `Erro ao enviar notificação para ${finalDestinatarioUid} (Tipo: ${tipo}):`,
      error,
    );
    throw new HttpsError(
      "internal",
      error.message || "Erro interno ao registrar a notificação.",
    );
  }
});
