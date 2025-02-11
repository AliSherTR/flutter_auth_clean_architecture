import 'package:dartz/dartz.dart';
import 'package:user_auth_clean_architecture/features/user/domain/repositories/user_repository.dart';

class SigupUsecase {
  final UserRepository repository;
  SigupUsecase({required this.repository});

  Future<Either<String, String>> call(
    String firstName,
    String lastName,
    String email,
    String password,
    String confirmPassword,
  ) {
    return repository.signUp(
        firstName, lastName, email, password, confirmPassword);
  }
}
