import 'dart:io' as io;

class RegisterParams {
  String? name;
  String? email;
  String? password;
  io.File? image;

  RegisterParams({this.name, this.email, this.password, this.image});

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['name'] = this.name ?? "";
    data['email'] = this.email ?? "";
    data['password'] = this.password ?? "";
    return data;
  }
}
