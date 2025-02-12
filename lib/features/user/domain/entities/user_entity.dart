import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String token;

  final String? role;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? image;
  final String? balance;

  const UserEntity({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.token,
    this.role,
    this.dateOfBirth,
    this.phoneNumber,
    this.image,
    this.balance,
  });

  @override
  List<Object?> get props => [
        email,
        firstName,
        lastName,
        token,
        role,
        dateOfBirth,
        phoneNumber,
        image,
        balance,
      ];
}
