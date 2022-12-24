import 'package:property_management_system/core/model/property_model/my_property_server_model.dart';

class MyPropertyLocalModel {
  int? id;
  String? name;
  String? description;
  int? roomnumber;
  String? state;
  int? price;
  String? local;
  double? lan;
  double? lat;
  int? bathroomnumber;
  int? bedroomnumber;
  String? propartytype;
  int? userId;
  String? deletedAt;
  int? commentCount;
  int? viewCount;
  int? likeCount;
  List<String>? comment;
  User? user;
  List<String>? photo;

  MyPropertyLocalModel(
      {this.id,
      this.name,
      this.description,
      this.roomnumber,
      this.state,
      this.price,
      this.local,
      this.lan,
      this.lat,
      this.bathroomnumber,
      this.bedroomnumber,
      this.propartytype,
      this.userId,
      this.deletedAt,
      this.commentCount,
      this.viewCount,
      this.likeCount,
      this.comment,
      this.user,
      this.photo});
}
