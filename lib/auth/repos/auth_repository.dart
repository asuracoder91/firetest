import 'package:firebase_auth/firebase_auth.dart';
import 'package:firetest/auth/firebase_app_instances.dart';

class AuthRepository {
  User? get currentUser => fbAuth.currentUser;

  Future<void> signup({
    required String nickname,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await fbAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final signedInUser = userCredential.user!;

      await usersCollection.doc(signedInUser.uid).set({
        'nickname': nickname,
        'email': email,
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
