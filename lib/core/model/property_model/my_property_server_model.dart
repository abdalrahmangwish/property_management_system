class MyPropertyServerModel {
  bool? success;
  List<Data>? data;
  String? massage;

  MyPropertyServerModel({this.success, this.data, this.massage});

  MyPropertyServerModel.fromJson(Map<String, dynamic> json) {
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
  Null? deletedAt;
  int? commentCount;
  int? viewCount;
  int? likeCount;
  List<String>? comment;
  User? user;
  List<Photo>? photo;

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
      this.commentCount,
      this.viewCount,
      this.likeCount,
      this.comment,
      this.user,
      this.photo});

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
    commentCount = json['comment_count'];
    viewCount = json['view_count'];
    likeCount = json['like_count'];
    comment = json['comment'].cast<String>();
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(new Photo.fromJson(v));
      });
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
    data['comment_count'] = this.commentCount;
    data['view_count'] = this.viewCount;
    data['like_count'] = this.likeCount;
    data['comment'] = this.comment;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.photo != null) {
      data['photo'] = this.photo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? role;
  String? phoneNo;
  String? photo;
  int? isVerified;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.role,
      this.phoneNo,
      this.photo,
      this.isVerified,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    phoneNo = json['phone_no'];
    photo = json['photo'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['phone_no'] = this.phoneNo;
    data['photo'] = this.photo;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
