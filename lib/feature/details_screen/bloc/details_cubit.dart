import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_management_system/core/helper/http_helper.dart';
import 'package:property_management_system/core/model/property_model/property_local_details_model.dart';
import 'package:property_management_system/core/utils/account_utils.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  PropertyLocalDetailsModel? propertyDetailsModel;

  void initState(int id) async {
    (await HttpHelper.getPropertyDetails(id)).either((left) {
      if (left.data != null) {
        List<String> photo = [];
        if (left.data!.photo!.isNotEmpty)
          photo = left.data!.photo!.first.photo!.split('@@');
        for (int i = 0; i < photo.length; i++) {
          photo[i] = AccountUtils.setImagePath(photo[i]);
        }
        propertyDetailsModel = PropertyLocalDetailsModel(
            userId: left.data!.userId,
            roomnumber: left.data!.roomnumber,
            state: left.data!.state,
            propartytype: left.data!.propartytype,
            price: left.data!.price,
            photo: photo,
            local: left.data!.local,
            lat: left.data!.lat,
            lan: left.data!.lan,
            description: left.data!.description,
            deletedAt: left.data!.deletedAt,
            bedroomnumber: left.data!.bedroomnumber,
            bathroomnumber: left.data!.bathroomnumber,
            name: left.data!.name,
            id: left.data!.id,
            comment: left.data!.comment,
            commentCount: left.data!.commentCount,
            likeCount: left.data!.likeCount,
            viewCount: left.data!.viewCount);
      }
    }, (right) {});
    emit(DetailsInitial());
    emit(DetailsLoaded());
  }

  void dispose() {
    propertyDetailsModel = null;
  }
}
