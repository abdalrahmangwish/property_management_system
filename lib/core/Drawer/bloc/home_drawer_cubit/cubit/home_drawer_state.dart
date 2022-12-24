part of 'home_drawer_cubit.dart';

@immutable
abstract class HomeDrawerState {}

class HomeDrawerInitial extends HomeDrawerState {}

class HomeDrawerLoading extends HomeDrawerState {}

class HomeDrawerLoaded extends HomeDrawerState {}
