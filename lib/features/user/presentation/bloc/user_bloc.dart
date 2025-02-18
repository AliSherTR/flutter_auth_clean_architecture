import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_auth_clean_architecture/features/user/domain/entities/user_entity.dart';
import 'package:user_auth_clean_architecture/features/user/domain/usecases/login_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LoginUsecase loginUsecase;

  UserBloc(this.loginUsecase) : super(UserInitial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(UserLoading());
      final result = await loginUsecase(event.email, event.password);

      print("email ${event.email}");
      result.fold(
        (failure) => emit(UserLoginFailure(errorMessage: failure)),
        (user) => emit(UserLoginSuccess(user: user)),
      );
    });
  }
}
