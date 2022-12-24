part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenLoading extends SplashScreenState {}

class SplashScreenLoaded extends SplashScreenState {}

class SplashScreenNotRegistered extends SplashScreenState {}

class SplashScreenRejectPermissionState extends SplashScreenState {}
