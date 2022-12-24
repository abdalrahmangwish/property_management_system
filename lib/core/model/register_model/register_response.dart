class RegisterResponse {
  bool? success;
  Data? data;
  String? token;
  String? massage;

  RegisterResponse({this.success, this.data, this.massage});

  RegisterResponse.fromJson(Map<dynamic, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
    massage = json['massage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['massage'] = this.massage;
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? phoneNo;
  String? user_role;
  String? userImageUri;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
      this.email,
      this.phoneNo,
      this.updatedAt,
      this.userImageUri,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNo = json['phone_no'];
    user_role = json['role'];
    userImageUri = json['photo'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNo;
    data['role'] = this.user_role;
    data['photo'] = this.userImageUri;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
