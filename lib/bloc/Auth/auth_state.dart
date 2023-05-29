part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthEror extends AuthState {
  String erorText;
  AuthEror({
    required this.erorText,
  });
}
