import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_management_system/core/helper/database_helper.dart';
import 'package:property_management_system/core/helper/database_model/identity_model.dart';
import 'package:property_management_system/core/helper/http_helper.dart';
import 'package:property_management_system/core/model/property_model/property_local_model.dart';
import 'package:property_management_system/core/utils/account_utils.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  MyIdentity? identity;
  DatabaseHelper db = DatabaseHelper();
  List<PropertyLocalModel> li = [];

  void initState() async {
    List<MyIdentity>? temp = await db.getMyIdentity();
    if (temp != null && temp.isNotEmpty) {
      identity = temp.first;
    }
    (await HttpHelper.getAllProperty()).either((left) {
      li = [];
      if (left.data != null) {
        left.data!.forEach((element) {
          List<String> photo = [];
          if (element.photo!.isNotEmpty)
            photo = element.photo!.first.photo!.split('@@');
          for (int i = 0; i < photo.length; i++) {
            photo[i] = AccountUtils.setImagePath(photo[i]);
          }

          li.add(PropertyLocalModel(
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
    print(li.length);
    emit(HomeInitial());
    emit(HomeLoaded());
  }
}
