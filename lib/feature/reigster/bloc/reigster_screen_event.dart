part of 'reigster_screen_bloc.dart';

abstract class ReigsterScreenEvent {}

class ReigsterScreenRegisterEvent extends ReigsterScreenEvent {
  final String email;
  final String name;
  final String password;
  final File? image;

  ReigsterScreenRegisterEvent(
      {required this.email,
      required this.name,
      required this.password,
      required this.image});
}

class ReigsterScreenDropDownValue extends ReigsterScreenEvent {
  final bool value;

  ReigsterScreenDropDownValue(this.value);
}
