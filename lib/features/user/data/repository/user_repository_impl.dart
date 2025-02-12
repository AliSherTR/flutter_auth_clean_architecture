import 'package:dartz/dartz.dart';
import 'package:user_auth_clean_architecture/features/user/data/datasource/user_remote_data_source.dart';
import 'package:user_auth_clean_architecture/features/user/data/models/user_model.dart';
import 'package:user_auth_clean_architecture/features/user/domain/entities/user_entity.dart';
import 'package:user_auth_clean_architecture/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource dataSource;

  UserRepositoryImpl({required this.dataSource});
  @override
  Future<Either<String, UserEntity>> getMyDetails(String token) {
    // TODO: implement getMyDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<String, UserEntity>> login(
      String email, String password) async {
    try {
      UserModel user = await dataSource.signIn(email, password);
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> signUp(String firstName, String lastName,
      String email, String password, String confirmPassword) async {
    try {
      final message = await dataSource.signUp(
          firstName, lastName, email, password, confirmPassword);
      return Right(message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
