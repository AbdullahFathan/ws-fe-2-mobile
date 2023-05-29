part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  RegisterModel registerModel;
  RegisterEvent({
    required this.registerModel,
  });
}
