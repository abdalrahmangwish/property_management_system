import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:property_management_system/core/helper/http_helper.dart';
import 'package:property_management_system/core/model/property_model/property_model.dart';

part 'add_screen_cubit_state.dart';

class AddScreenCubit extends Cubit<AddScreenCubitState> {
  AddScreenCubit() : super(AddScreenCubitInitial());

  List<UploadingImageModel> fileList = [];
  LatLng? latLng;

  void addProperty(PropertyModel model) async {
    emit(AddScreenCubitUploadedAdding());
    (await HttpHelper.addProperty(model)).either((left) {
      emit(AddScreenCubitUploadedAdded());
    }, (right) {
      emit(AddScreenCubitUploadedErorr());
    });
  }

  void dispose() {
    latLng = null;
    fileList.clear();
  }

  void setLatLng(LatLng lng) {
    latLng = lng;
    emit(AddScreenCubitInitial());
    emit(AddScreenCubitLoaded());
  }

  void removeImage(int index) {
    fileList.removeAt(index);
    emit(AddScreenCubitInitial());
    emit(AddScreenCubitLoaded());
  }

  void uploadImage(XFile image) async {
    fileList.add(UploadingImageModel(
        image: File(image.path), state: ImageState.uploading));
    emit(AddScreenCubitInitial());
    emit(AddScreenCubitLoaded());
    (await HttpHelper.uploadImage(File(image.path))).either((left) {
      print(left);
      fileList.last.state = ImageState.completed;
      fileList.last.serverImagePath = left;
    }, (right) {
      fileList.last.state = ImageState.retry;
    });
    emit(AddScreenCubitInitial());
    emit(AddScreenCubitLoaded());
  }

  void reUpload(int index) async {
    fileList[index].state = ImageState.uploading;
    emit(AddScreenCubitInitial());
    emit(AddScreenCubitLoaded());
    (await HttpHelper.uploadImage(File(fileList[index].image.path))).either(
        (left) {
      fileList.last.state = ImageState.completed;
      fileList.last.serverImagePath = left;
    }, (right) {
      fileList.last.state = ImageState.retry;
    });
    emit(AddScreenCubitInitial());
    emit(AddScreenCubitLoaded());
  }
}

class UploadingImageModel {
  final File image;
  ImageState state;
  String? serverImagePath;

  UploadingImageModel(
      {required this.image, required this.state, this.serverImagePath});
}

enum ImageState { uploading, completed, retry }
