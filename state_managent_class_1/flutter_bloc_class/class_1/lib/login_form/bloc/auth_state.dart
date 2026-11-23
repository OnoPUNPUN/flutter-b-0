part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccessState extends AuthState {
  final String uid;

  new({required this.uid});
}

final class AuthFailureState extends AuthState {
  final String errorMessagea;

  new(this.errorMessagea);
}

final class AuthLoadingState extends AuthState {}
