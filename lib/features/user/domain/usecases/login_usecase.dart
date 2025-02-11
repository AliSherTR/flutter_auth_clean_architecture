import 'package:dartz/dartz.dart';
import 'package:user_auth_clean_architecture/features/user/domain/entities/user_entity.dart';
import 'package:user_auth_clean_architecture/features/user/domain/repositories/user_repository.dart';

class LoginUsecase {
  final UserRepository repository;
  LoginUsecase({required this.repository});

  Future<Either<String, UserEntity>> call(String email, String password) {
    return repository.login(email, password);
  }
}
