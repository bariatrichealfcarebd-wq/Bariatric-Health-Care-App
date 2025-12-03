import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCUtroC3eCspWPBUH1Kg5qS3Vgf4V_L1xg",
            authDomain: "bariatrichealfcare-c2d9c.firebaseapp.com",
            projectId: "bariatrichealfcare-c2d9c",
            storageBucket: "bariatrichealfcare-c2d9c.firebasestorage.app",
            messagingSenderId: "12166217223",
            appId: "1:12166217223:web:7830a913c990aa6584f4a2"));
  } else {
    await Firebase.initializeApp();
  }
}
