import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.freezed.dart';

@freezed
abstract class AppUserModel with _$AppUserModel {
  const factory AppUserModel({
    @Default('') String id,
    @Default('') String nickname,
    @Default('') String email,
  }) = _AppUserModel;

  factory AppUserModel.fromDoc(DocumentSnapshot doc) {
    final appUserModelData = doc.data() as Map<String, dynamic>;
    return AppUserModel(
      id: doc.id,
      nickname: appUserModelData['nickname'],
      email: appUserModelData['email'],
    );
  }
}
