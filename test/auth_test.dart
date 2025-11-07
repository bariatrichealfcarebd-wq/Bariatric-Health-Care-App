import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:bariatric_health_care/auth/firebase_auth/firebase_auth_manager.dart';
import 'package:bariatric_health_care/auth/base_auth_user_provider.dart';

void main() {
  group('FirebaseAuthManager', () {
    late FirebaseAuthManager authManager;
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      authManager = FirebaseAuthManager(firebaseAuth: mockFirebaseAuth);
    });

    test('signInWithEmail success', () async {
      final user = await authManager.signInWithEmail(
        null,
        'test@test.com',
        'password',
      );

      expect(user, isNotNull);
      expect(mockFirebaseAuth.currentUser, isNotNull);
      expect(mockFirebaseAuth.currentUser!.email, 'test@test.com');
    });

    test('createAccountWithEmail success', () async {
      final user = await authManager.createAccountWithEmail(
        null,
        'test@test.com',
        'password',
      );

      expect(user, isNotNull);
      expect(mockFirebaseAuth.currentUser, isNotNull);
      expect(mockFirebaseAuth.currentUser!.email, 'test@test.com');
    });

    test('signOut', () async {
      // Sign in first
      await authManager.signInWithEmail(null, 'test@test.com', 'password');
      expect(mockFirebaseAuth.currentUser, isNotNull);

      // Sign out
      await authManager.signOut();
      expect(mockFirebaseAuth.currentUser, isNull);
    });

    test('deleteUser', () async {
      // Sign in first
      final authUser = await authManager.signInWithEmail(null, 'test@test.com', 'password');
      currentUser = authUser; // Set the global currentUser
      expect(mockFirebaseAuth.currentUser, isNotNull);

      // Delete user
      await authManager.deleteUser(null);
      expect(mockFirebaseAuth.currentUser, isNull);
    });
  });
}
