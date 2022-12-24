class PropertyLocalModel {
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
  List<String>? photo;
  int? viewCount;

  PropertyLocalModel(
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
      this.photo,
      required this.viewCount});
}
