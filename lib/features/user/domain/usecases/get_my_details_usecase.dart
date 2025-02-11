import 'package:dartz/dartz.dart';
import 'package:user_auth_clean_architecture/features/user/domain/entities/user_entity.dart';
import 'package:user_auth_clean_architecture/features/user/domain/repositories/user_repository.dart';

class GetMyDetailsUsecase {
  final UserRepository repository;

  GetMyDetailsUsecase({required this.repository});

  Future<Either<String, UserEntity>> call(String token) {
    return repository.getMyDetails(token);
  }
}
