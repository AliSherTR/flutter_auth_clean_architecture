part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}


class UserLoginEvent extends UserEvent {
  final String email;
  final String password;

  const UserLoginEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}