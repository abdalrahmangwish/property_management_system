part of 'add_screen_cubit_cubit.dart';

@immutable
abstract class AddScreenCubitState {}

class AddScreenCubitInitial extends AddScreenCubitState {}

class AddScreenCubitLoaded extends AddScreenCubitState {}

class AddScreenCubitUploading extends AddScreenCubitState {
  final int id;

  AddScreenCubitUploading(this.id);
}

class AddScreenCubitUploaded extends AddScreenCubitState {
  final int id;

  AddScreenCubitUploaded(this.id);
}

class AddScreenCubitUploadedAdding extends AddScreenCubitState {}

class AddScreenCubitUploadedAdded extends AddScreenCubitState {}

class AddScreenCubitUploadedErorr extends AddScreenCubitState {}
