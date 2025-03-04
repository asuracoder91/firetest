import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firetest/auth/firebase_app_instances.dart';
import 'package:firetest/auth/models/app_user_model.dart';

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

  Future<void> signin({required String email, required String password}) async {
    try {
      await fbAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signout() async {
    try {
      await fbAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AppUserModel> getProfile({required String uid}) async {
    try {
      final DocumentSnapshot appUserDoc = await usersCollection.doc(uid).get();

      if (appUserDoc.exists) {
        final appUser = AppUserModel.fromDoc(appUserDoc);
        return appUser;
      }

      throw 'User not found';
    } catch (e) {
      throw Exception(e);
    }
  }
}
