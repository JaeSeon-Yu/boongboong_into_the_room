import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

abstract class UserModelBase {}

class UserModelLoading extends UserModelBase{}

class UserModelError extends UserModelBase {
  final String message;

  UserModelError({required this.message});
}

@JsonSerializable()
class UserModel extends UserModelBase {
  final String uid;
  final String email;

  UserModel({
    required this.uid,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
