part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoginSuccess extends UserState {
  final UserEntity user;

  const UserLoginSuccess({required this.user});
  @override
  List<Object> get props => super.props;
}

final class UserLoginFailure extends UserState {
  final String errorMessage;
  const UserLoginFailure({required this.errorMessage});
  @override
  List<Object> get props => super.props;
}
