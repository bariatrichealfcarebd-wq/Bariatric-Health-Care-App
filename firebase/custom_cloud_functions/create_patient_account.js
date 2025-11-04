exports.createPatientAccount = onCall(async (request) => {
  if (!request.auth || !request.auth.token.isADM) {
    throw new HttpsError(
      "permission-denied",
      "Apenas administradores podem criar contas.",
    );
  }
  const { email, password, nome, cpf, role, crn, telefone, especializacao } =
    request.data;
  if (!email || !password || !nome || !cpf || !role) {
    throw new HttpsError(
      "invalid-argument",
      "Todos os campos (email, password, nome, cpf, role) são obrigatórios.",
    );
  }

  let userRecord;
  try {
    userRecord = await admin
      .auth()
      .createUser({ email, password, displayName: nome });

    let claims = { isADM: false, admLess: false };
    if (role === "isADM") claims = { isADM: true, admLess: false };
    else if (role === "admLess") claims = { isADM: false, admLess: true };
    await admin.auth().setCustomUserClaims(userRecord.uid, claims);

    const encryptionKey = await getEncryptionKey();
    const iv = crypto.randomBytes(IV_LENGTH);
    const cipher = crypto.createCipheriv(
      "aes-256-cbc",
      Buffer.from(encryptionKey, "hex"),
      iv,
    );
    let encrypted = cipher.update(cpf);
    encrypted = Buffer.concat([encrypted, cipher.final()]);
    const encryptedCpf = iv.toString("hex") + ":" + encrypted.toString("hex");

    // <<< LÓGICA DE SEARCHKEYWORDS ADICIONADA DE VOLTA >>>
    const nomeLowerCase = nome.toLowerCase();
    const keywords = [nomeLowerCase];
    const nameParts = nomeLowerCase.split(" ");
    nameParts.forEach((part) => {
      if (part && !keywords.includes(part)) {
        keywords.push(part);
      }
    });

    const userPayload = {
      Nome: nome,
      email: email,
      CPF: encryptedCpf,
      uid: userRecord.uid,
      created_time: admin.firestore.FieldValue.serverTimestamp(),
      isADM: claims.isADM,
      admLess: claims.admLess,
      primeiroLoginProcessado: false,
      searchKeywords: keywords, // <<< CAMPO ADICIONADO AO PAYLOAD >>>
    };

    if (role === "isADM" || role === "admLess") {
      userPayload.CRN = CRN;
      userPayload.telefone = telefone;
      userPayload.especializacao = especializacao;
    }

    await admin
      .firestore()
      .collection("Paciente")
      .doc(userRecord.uid)
      .set(userPayload);

    const nutriUid = request.auth.uid;
    const pacienteUid = userRecord.uid;
    const linkPayload = { uid_Paciente: pacienteUid, uid_Nutri: nutriUid };
    await admin
      .firestore()
      .collection("Nutri_Paciente")
      .doc(pacienteUid)
      .set(linkPayload);

    return {
      status: "success",
      message: "Usuário criado e vinculado com sucesso!",
      uid: userRecord.uid,
    };
  } catch (error) {
    console.error("Erro ao criar conta de usuário:", error);
    if (userRecord && userRecord.uid)
      await admin.auth().deleteUser(userRecord.uid);
    throw new HttpsError(
      "internal",
      error.message || "Ocorreu um erro inesperado.",
    );
  }
});
