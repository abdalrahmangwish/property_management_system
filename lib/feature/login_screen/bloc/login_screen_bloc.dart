import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_management_system/core/helper/database_helper.dart';
import 'package:property_management_system/core/helper/database_model/identity_model.dart';
import 'package:property_management_system/core/helper/http_helper.dart';
import 'package:property_management_system/core/model/login_model/login_params.dart';
import 'package:property_management_system/core/utils/account_utils.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitial()) {
    DatabaseHelper db = DatabaseHelper();
    on<LoginInScreenLoginEvent>((event, emit) async {
      emit(LoginScreenLoading());
      print('ddfdfdf');
      (await HttpHelper.login(LoginParams(
        email: event.email,
        password: event.password,
      )))
          .either((left) {
        print(left.data!.email);
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
          emit(LoginScreenLoaded());
        }
      }, (right) {
        emit(LoginScreenError('error while loading'));
      });
    });
  }
}
