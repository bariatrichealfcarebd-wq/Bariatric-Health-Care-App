import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:bariatric_health_care/backend/backend.dart';
import 'package:bariatric_health_care/auth/firebase_auth/auth_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  group('Backend Tests', () {
    late FakeFirebaseFirestore fakeFirestore;
    late MockUser mockUser;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      mockUser = MockUser(
        uid: 'test_uid',
        email: 'test@example.com',
        displayName: 'Test User',
        photoURL: 'http://example.com/photo.jpg',
        phoneNumber: '1234567890',
      );

      // This is the key to making the tests work without refactoring the code
      FirebaseFirestore.instance = fakeFirestore;
    });

    test('createPacienteRecordData creates a valid map', () {
      final createdTime = DateTime.now();
      final data = createPacienteRecordData(
        email: 'test@example.com',
        displayName: 'Test User',
        uid: 'test_uid',
        createdTime: createdTime,
      );

      expect(data['email'], 'test@example.com');
      expect(data['display_name'], 'Test User');
      expect(data['uid'], 'test_uid');
      expect(data['created_time'], createdTime);
      expect(data.containsKey('photo_url'), false); // Null values should not be included
    });

    test('maybeCreateUser creates a new user document if one does not exist', () async {
      // Act
      await maybeCreateUser(mockUser);

      // Assert
      final userDoc = await fakeFirestore.collection('Paciente').doc(mockUser.uid).get();
      expect(userDoc.exists, isTrue);
      expect(userDoc.data()?['uid'], 'test_uid');
      expect(userDoc.data()?['email'], 'test@example.com');
      expect(userDoc.data()?['display_name'], 'Test User');

      // Assert that the currentUserDocument is set
      expect(currentUserDocument, isNotNull);
      expect(currentUserDocument!.uid, 'test_uid');
    });

    test('maybeCreateUser does not create a new user document if one already exists', () async {
      // Arrange: Create a user document
      await fakeFirestore.collection('Paciente').doc(mockUser.uid).set({
        'uid': 'test_uid',
        'email': 'existing@example.com',
        'display_name': 'Existing User',
      });

      // Act
      await maybeCreateUser(mockUser);

      // Assert
      final userDoc = await fakeFirestore.collection('Paciente').doc(mockUser.uid).get();
      expect(userDoc.exists, isTrue);
      // Check that the existing data is not overwritten
      expect(userDoc.data()?['email'], 'existing@example.com');
      expect(userDoc.data()?['display_name'], 'Existing User');


      // Assert that the currentUserDocument is set from the existing document
      expect(currentUserDocument, isNotNull);
      expect(currentUserDocument!.uid, 'test_uid');
      expect(currentUserDocument!.email, 'existing@example.com');
    });
  });
}
