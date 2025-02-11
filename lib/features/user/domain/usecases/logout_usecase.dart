import 'package:user_auth_clean_architecture/features/user/domain/repositories/user_repository.dart';

class LogoutUsecase {
  final UserRepository repository;

  LogoutUsecase({required this.repository});

  void call() {
    repository.logout();
  }
}
