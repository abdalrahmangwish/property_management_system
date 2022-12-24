import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_management_system/core/helper/database_helper.dart';
import 'package:property_management_system/core/helper/http_helper.dart';
import 'package:property_management_system/core/model/property_model/my_property_local_model.dart';
import 'package:property_management_system/core/utils/account_utils.dart';
import 'package:property_management_system/feature/home_screen/bloc/cubit/home_cubit.dart';
import 'package:property_management_system/injection_container.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<MyPropertyLocalModel> li = [];

  void initState() async {
    int id = await databaseHelper.getServerIdFromMyIdentity();
    (await HttpHelper.getMyProperty(id)).either((left) {
      li = [];
      if (left.data != null) {
        left.data!.forEach((element) {
          List<String> photo = [];
          if (element.photo!.isNotEmpty)
            photo = element.photo!.first.photo!.split('@@');
          for (int i = 0; i < photo.length; i++) {
            photo[i] = AccountUtils.setImagePath(photo[i]);
          }

          li.add(MyPropertyLocalModel(
              comment: element.comment,
              commentCount: element.commentCount,
              likeCount: element.likeCount,
              user: element.user,
              viewCount: element.viewCount,
              id: element.id,
              name: element.name,
              bathroomnumber: element.bathroomnumber,
              bedroomnumber: element.bedroomnumber,
              deletedAt: element.deletedAt,
              description: element.description,
              lan: element.lan,
              lat: element.lat,
              local: element.local,
              photo: photo,
              price: element.price,
              propartytype: element.propartytype,
              state: element.state,
              roomnumber: element.roomnumber,
              userId: element.userId));
        });
      }
    }, (right) {});
    emit(FavoriteInitial());
    emit(FavoriteLoaded());
  }

  void deleteProperty(int id) async {
    (await HttpHelper.deleteProperty(id)).either((left) {
      initState();
      sl<HomeCubit>().initState();
    }, (right) {});
  }
}
