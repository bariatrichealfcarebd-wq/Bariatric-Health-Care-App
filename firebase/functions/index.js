const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

/**
 * Gatilho executado quando um usuário é excluído do Firebase Authentication.
 * @param {functions.auth.UserRecord} user - O objeto do usuário excluído.
 * @returns {Promise<void>}
 */
exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("Paciente/" + user.uid);
});
