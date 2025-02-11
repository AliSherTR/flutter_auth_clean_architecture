import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.token,
    super.role,
    super.dateOfBirth,
    super.phoneNumber,
    super.image,
    super.balance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      token: json['access_token'],
      role: json['role'],
      dateOfBirth: json['dateOfBirth'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
      balance: json['balance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'token': token,
      'role': role,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'image': image,
      'balance': balance,
    };
  }
}
