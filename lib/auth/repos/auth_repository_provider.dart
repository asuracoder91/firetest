import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../firebase_app_instances.dart';
import '../models/app_user_model.dart';
import 'auth_repository.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}

@riverpod
Stream<User?> authStateStream(Ref ref) {
  return fbAuth.authStateChanges();
}

@riverpod
FutureOr<AppUserModel> userInfo(Ref ref, String uid) {
  return ref.watch(authRepositoryProvider).getProfile(uid: uid);
}
