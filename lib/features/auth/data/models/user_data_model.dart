import 'package:maaredh/features/auth/domain/entities/user_data_entity.dart';

UserModel userModelFromJson(Map<String, dynamic> response) => UserModel.fromJson(response);

Map<String, dynamic> userModelToJson(UserModel userModel) => userModel.toJson();

class UserModel extends UserEntity {
  const UserModel({
    required int userId,
    required String userName,
    required String photo,
  }) : super(userId: userId, userName: userName, photo: photo);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userID"],
        userName: json["userName"],
        photo: json["photo"] == null || json["photo"] is! String ? null : json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "userName": userName,
        "photo": photo,
      };
}
