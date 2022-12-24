import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_management_system/core/helper/database_helper.dart';

part 'home_drawer_state.dart';

class HomeDrawerCubit extends Cubit<HomeDrawerState> {
  HomeDrawerCubit() : super(HomeDrawerInitial());
  DatabaseHelper db = DatabaseHelper();
  void logout() async {
    emit(HomeDrawerLoading());
    await db.deleteMyDatabase();
    emit(HomeDrawerLoaded());
  }
}
