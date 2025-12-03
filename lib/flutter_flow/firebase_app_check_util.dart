// codigo gerado automaticamente pelo flutterflow: utilitários e configurações

import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider:
          ReCaptchaV3Provider('6LcQNwIsAAAAAL5i4f7mc4FsHh5OMXDEks0_ieZg'),
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.deviceCheck,
    );
