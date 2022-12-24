class PropertyServerModel {
  bool? success;
  List<Data>? data;
  String? massage;

  PropertyServerModel({this.success, this.data, this.massage});

  PropertyServerModel.fromJson(Map<dynamic, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    massage = json['massage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['massage'] = this.massage;
    return data;
  }
}

class Data {
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
  List<Photo>? photo;
  int? viewCount;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    roomnumber = json['roomnumber'];
    state = json['state'];
    price = json['price'];
    local = json['local'];
    lan = json['lan'];
    lat = json['lat'];
    bathroomnumber = json['bathroomnumber'];
    bedroomnumber = json['bedroomnumber'];
    propartytype = json['propartytype'];
    userId = json['user_id'];
    deletedAt = json['deleted_at'];
    viewCount = json["view_count"];
    if (json['photo'] != null) {
      List<Photo> tempPhoto = [];
      json['photo'].forEach((v) {
        Photo newPhoto = (Photo.fromJson(v));
        tempPhoto.add(newPhoto);
      });
      photo = tempPhoto;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['roomnumber'] = this.roomnumber;
    data['state'] = this.state;
    data['price'] = this.price;
    data['local'] = this.local;
    data['lan'] = this.lan;
    data['lat'] = this.lat;
    data['bathroomnumber'] = this.bathroomnumber;
    data['bedroomnumber'] = this.bedroomnumber;
    data['propartytype'] = this.propartytype;
    data['user_id'] = this.userId;
    data['deleted_at'] = this.deletedAt;
    data['view_count'] = this.viewCount;
    if (this.photo != null) {
      data['photo'] = this.photo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photo {
  int? id;
  String? photo;
  int? estateId;

  Photo({this.id, this.photo, this.estateId});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    estateId = json['estate_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['estate_id'] = this.estateId;
    return data;
  }
}
