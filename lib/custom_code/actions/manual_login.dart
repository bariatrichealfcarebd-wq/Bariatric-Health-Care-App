// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Importe o Firebase Auth
import 'package:firebase_auth/firebase_auth.dart';

Future<String> manualLogin(
  String email,
  String password,
) async {
  // Verifica se os campos não estão vazios
  if (email.isEmpty || password.isEmpty) {
    return 'Por favor, preencha o email e a senha.';
  }

  try {
    // Tenta fazer o login
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(), // .trim() remove espaços em branco
      password: password,
    );
    // Se deu certo, retorna "SUCCESS"
    return 'SUCCESS';
  } on FirebaseAuthException catch (e) {
    // Se deu errado, retorna uma mensagem de erro amigável
    if (e.code == 'user-not-found') {
      return 'Nenhum usuário encontrado com este email.';
    } else if (e.code == 'wrong-password') {
      return 'Senha incorreta.';
    } else if (e.code == 'invalid-credential' || e.code == 'invalid-email') {
      return 'Email ou senha inválida.';
    }
    // Erro genérico
    return 'Ocorreu um erro. Tente novamente.';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
