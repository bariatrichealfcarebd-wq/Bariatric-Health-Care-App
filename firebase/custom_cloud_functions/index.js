const admin = require("firebase-admin/app");
admin.initializeApp();

const encryptData = require("./encrypt_data.js");
exports.encryptData = encryptData.encryptData;
const decryptData = require("./decrypt_data.js");
exports.decryptData = decryptData.decryptData;
const createPatientAccount = require("./create_patient_account.js");
exports.createPatientAccount = createPatientAccount.createPatientAccount;
const promoteUserToAdmin = require("./promote_user_to_admin.js");
exports.promoteUserToAdmin = promoteUserToAdmin.promoteUserToAdmin;
const onFirstPatientLogin = require("./on_first_patient_login.js");
exports.onFirstPatientLogin = onFirstPatientLogin.onFirstPatientLogin;
const marcarNotificacoesComoLidas = require("./marcar_notificacoes_como_lidas.js");
exports.marcarNotificacoesComoLidas =
  marcarNotificacoesComoLidas.marcarNotificacoesComoLidas;
