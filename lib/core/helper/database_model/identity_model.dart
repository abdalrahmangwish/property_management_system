class MyIdentity {
  int? id;
  int? serverId;
  String? name;
  String? token;
  String? imageUrl;
  int? user_role;
  String? phoneNumber;
  String? email;

  MyIdentity(
      {this.id,
      this.name,
      this.token,
      this.email,
      this.imageUrl,
      this.phoneNumber,
      this.user_role,
      required this.serverId});

  MyIdentity copyWith(
          {String? token,
          int? id,
          String? name,
          String? email,
          String? phoneNumber,
          int? uesr_role,
          String? imageUrl,
          int? serverId}) =>
      MyIdentity(
          serverId: serverId ?? this.serverId,
          id: id ?? this.id,
          token: token ?? this.token,
          name: name ?? this.name,
          email: email ?? this.email,
          imageUrl: imageUrl ?? this.imageUrl,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          user_role: user_role ?? this.user_role);

  MyIdentity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    token = json['token'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    phoneNumber = json['phoneNumber'];
    user_role = json['user_role'];
    serverId = json['serverId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serverId'] = this.serverId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['token'] = this.token;
    data['email'] = this.email;
    data['user_role'] = this.user_role;
    data['phoneNumber'] = this.phoneNumber;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  factory MyIdentity.fromMap(Map<String, dynamic> json) => MyIdentity(
        serverId: json["serverId"] == null ? null : json["serverId"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        token: json["token"] == null ? null : json["token"],
        email: json["email"] == null ? null : json["email"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        user_role: json["user_role"] == null ? null : json["user_role"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "token": token == null ? null : token,
        "user_role": user_role == null ? null : user_role,
        "email": email == null ? null : email,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "serverId": serverId == null ? null : serverId,
      };
}
