import 'package:flutter/material.dart';

import 'base_auth_user_provider.dart';

/// Define o contrato para gerenciamento de autenticação, incluindo operações
/// como signOut, exclusão de usuário e atualização de credenciais.
abstract class AuthManager {
  Future signOut();
  Future deleteUser(BuildContext context);
  Future updateEmail({required String email, required BuildContext context});
  Future resetPassword({required String email, required BuildContext context});
  Future sendEmailVerification() async => currentUser?.sendEmailVerification();
  Future refreshUser() async => currentUser?.refreshUser();
}

/// Fornece a funcionalidade de login e criação de conta com email e senha.
mixin EmailSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithEmail(
    BuildContext context,
    String email,
    String password,
  );

  Future<BaseAuthUser?> createAccountWithEmail(
    BuildContext context,
    String email,
    String password,
  );
}

/// Permite o login anônimo de usuários.
mixin AnonymousSignInManager on AuthManager {
  Future<BaseAuthUser?> signInAnonymously(BuildContext context);
}

/// Habilita a autenticação utilizando o serviço da Apple.
mixin AppleSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithApple(BuildContext context);
}

/// Habilita a autenticação utilizando o serviço do Google.
mixin GoogleSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithGoogle(BuildContext context);
}

/// Permite a autenticação a partir de um token JWT.
mixin JwtSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithJwtToken(
    BuildContext context,
    String jwtToken,
  );
}

/// Gerencia o fluxo de autenticação por número de telefone (SMS).
mixin PhoneSignInManager on AuthManager {
  Future beginPhoneAuth({
    required BuildContext context,
    required String phoneNumber,
    required void Function(BuildContext) onCodeSent,
  });

  Future verifySmsCode({
    required BuildContext context,
    required String smsCode,
  });
}

/// Habilita a autenticação utilizando o serviço do Facebook.
mixin FacebookSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithFacebook(BuildContext context);
}

/// Habilita a autenticação utilizando o serviço da Microsoft.
mixin MicrosoftSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithMicrosoft(
    BuildContext context,
    List<String> scopes,
    String tenantId,
  );
}

/// Habilita a autenticação utilizando o serviço do Github.
mixin GithubSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithGithub(BuildContext context);
}
