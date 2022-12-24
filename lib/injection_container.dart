import 'package:get_it/get_it.dart';
import 'package:property_management_system/core/Drawer/bloc/home_drawer_cubit/cubit/home_drawer_cubit.dart';
import 'package:property_management_system/core/helper/map_permision_helper.dart';
import 'package:property_management_system/feature/add_screen/bloc/cubit/add_screen_cubit_cubit.dart';
import 'package:property_management_system/feature/cubit/main_cubit.dart';
import 'package:property_management_system/feature/details_screen/bloc/details_cubit.dart';
import 'package:property_management_system/feature/favorite_screen/bloc/favorite_cubit.dart';
import 'package:property_management_system/feature/home_screen/bloc/cubit/home_cubit.dart';
import 'package:property_management_system/feature/login_screen/bloc/login_screen_bloc.dart';
import 'package:property_management_system/feature/reigster/bloc/reigster_screen_bloc.dart';
import 'package:property_management_system/feature/splash_screen/bloc/splash_screen_bloc.dart';

final sl = GetIt.instance;

void init() {
  // class singleton
  sl.registerLazySingleton(
    () => MapHelper(),
  );

  //Bloc

  sl.registerLazySingleton(
    () => AddScreenCubit(),
  );
  sl.registerLazySingleton(
    () => FavoriteCubit(),
  );
  sl.registerLazySingleton(
    () => DetailsCubit(),
  );
  sl.registerLazySingleton(
    () => SplashScreenBloc(),
  );
  sl.registerLazySingleton(
    () => HomeCubit(),
  );
  sl.registerLazySingleton(
    () => HomeDrawerCubit(),
  );
  sl.registerLazySingleton(
    () => LoginScreenBloc(),
  );
  sl.registerLazySingleton(
    () => ReigsterScreenBloc(),
  );
  sl.registerLazySingleton(
    () => MainCubit(),
  );
}
