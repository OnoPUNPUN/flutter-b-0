part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class AuthLoginRequestedEvent extends AuthEvent {
  final String email;
  final String password;

  new({required this.email, required this.password});
}

final class AuthLogoutRquestedEvent extends AuthEvent {}
