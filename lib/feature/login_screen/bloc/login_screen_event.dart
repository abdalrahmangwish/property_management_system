part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent {}

class LoginScreenInitEvent extends LoginScreenEvent {}

class LoginInScreenLoginEvent extends LoginScreenEvent {
  final String email;
  final String password;

  LoginInScreenLoginEvent({required this.email, required this.password});
}
