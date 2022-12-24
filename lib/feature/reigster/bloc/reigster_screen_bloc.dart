import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:property_management_system/core/constant/assets.dart';
import 'package:property_management_system/core/helper/database_helper.dart';
import 'package:property_management_system/core/helper/database_model/identity_model.dart';
import 'package:property_management_system/core/helper/http_helper.dart';
import 'package:property_management_system/core/model/register_model/register_params.dart';
import 'package:property_management_system/core/utils/account_utils.dart';

part 'reigster_screen_event.dart';
part 'reigster_screen_state.dart';

class ReigsterScreenBloc
    extends Bloc<ReigsterScreenEvent, ReigsterScreenState> {
  bool manager = false;
  ReigsterScreenBloc() : super(ReigsterScreenInitial()) {
    DatabaseHelper db = DatabaseHelper();

    on<ReigsterScreenRegisterEvent>((event, emit) async {
      emit(ReigsterScreenLoading());
      File? image = event.image;
      if (event.image == null) {
        image = await getImageFileFromAssets(Assets.defultImage);
      }
      print(manager);
      if (manager) {
        (await HttpHelper.registerManager(RegisterParams(
                email: event.email,
                name: event.name,
                password: event.password,
                image: image)))
            .either((left) {
          if (left.data != null) {
            print(left.data!.user_role);
            print('sfsfffff');
            db.insertMyIdentity(MyIdentity(
                serverId: left.data!.id,
                email: left.data!.email,
                imageUrl:
                    AccountUtils.setImagePath(left.data!.userImageUri ?? ""),
                name: left.data!.name,
                phoneNumber: left.data!.phoneNo,
                token: left.token,
                user_role: left.data!.user_role == 'manger' ? 1 : 0));
            emit(ReigsterScreenLoaded());
          }
        }, (right) {
          print(right);
          emit(ReigsterScreenError('error while loading'));
        });
      } else {
        (await HttpHelper.register(RegisterParams(
                email: event.email,
                name: event.name,
                password: event.password,
                image: image)))
            .either((left) {
          if (left.data != null) {
            db.insertMyIdentity(MyIdentity(
                serverId: left.data!.id,
                email: left.data!.email,
                imageUrl:
                    AccountUtils.setImagePath(left.data!.userImageUri ?? ""),
                name: left.data!.name,
                phoneNumber: left.data!.phoneNo,
                token: left.token,
                user_role: left.data!.user_role == 'manger' ? 1 : 0));
            emit(ReigsterScreenLoaded());
          }
        }, (right) {
          print(right);
          emit(ReigsterScreenError('error while loading'));
        });
      }
    });

    on<ReigsterScreenDropDownValue>((event, emit) {
      manager = event.value;
      emit(ReigsterScreenInitial());
      emit(ReigsterScreenInitial2());
    });
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}
