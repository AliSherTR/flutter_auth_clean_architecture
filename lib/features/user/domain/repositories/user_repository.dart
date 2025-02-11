import 'package:dartz/dartz.dart';
import 'package:user_auth_clean_architecture/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<String, String>> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String confirmPassword,
  );

  Future<Either<String, UserEntity>> login(String email, String password);

  Future<Either<String, UserEntity>> getMyDetails(String token);

  Future<void> logout();
}
