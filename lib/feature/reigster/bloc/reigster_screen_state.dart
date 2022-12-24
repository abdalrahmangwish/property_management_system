part of 'reigster_screen_bloc.dart';

@immutable
abstract class ReigsterScreenState {}

class ReigsterScreenInitial extends ReigsterScreenState {}

class ReigsterScreenInitial2 extends ReigsterScreenState {}

class ReigsterScreenLoading extends ReigsterScreenState {}

class ReigsterScreenLoaded extends ReigsterScreenState {}

class ReigsterScreenError extends ReigsterScreenState {
  String errorMessage;
  ReigsterScreenError(this.errorMessage);
}

class ReigsterScreenRejectPermissionState extends ReigsterScreenState {}
