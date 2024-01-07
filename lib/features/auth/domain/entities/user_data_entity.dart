import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.userId,
    this.userName,
    this.photo,
  });

  final int? userId;
  final String? userName;
  final String? photo;

  @override
  List<Object?> get props => [
        userId,
        userName,
        photo,
      ];
}
