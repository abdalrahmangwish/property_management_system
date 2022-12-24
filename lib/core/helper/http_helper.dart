import 'dart:convert';
import 'dart:io';



class HttpHelper {
  static String url = 'http://10.0.2.2:8000/';
  static String baseUrl_api = 'http://10.0.2.2:8000/api';
  static DatabaseHelper db = DatabaseHelper();
  static Future<Either<RegisterResponse, String>> register(
      RegisterParams params) async {
    try {
      var url = Uri.parse(baseUrl_api + "/registeruser");
      http.MultipartRequest request = new http.MultipartRequest('POST', url);
      request.fields.addAll(params.toJson());
      if (params.image != null)
        request.files.add(await http.MultipartFile.fromPath(
          'photo',
          params.image == null ? '' : params.image!.path,
        ));
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode >= 300) return Right('error while connecting');
      final respStr = await response.stream.bytesToString();
      var decodedResponse = json.decode(respStr);
      print(decodedResponse);
      return Left(RegisterResponse.fromJson(decodedResponse));
    } catch (e) {
      print(e);
      return Right('error while connecting');
    }
  }

  static Future<Either<RegisterResponse, String>> registerManager(
      RegisterParams params) async {
    try {
      var url = Uri.parse(baseUrl_api + "/registermanjer");
      http.MultipartRequest request = new http.MultipartRequest('POST', url);
      request.fields.addAll(params.toJson());
      if (params.image != null)
        request.files.add(await http.MultipartFile.fromPath(
          'photo',
          params.image == null ? '' : params.image!.path,
        ));
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode >= 300) return Right('error while connecting');
      final respStr = await response.stream.bytesToString();
      print(respStr);
      var decodedResponse = json.decode(respStr);
      return Left(RegisterResponse.fromJson(decodedResponse));
    } catch (e) {
      return Right('error while connecting');
    }
  }

  static Future<Either<LoginResponse, String>> login(LoginParams params) async {
    try {
      var url = Uri.parse(baseUrl_api + "/login");
      print(params.toJson());
      var response = await http.post(url, body: params.toJson());
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return Left(LoginResponse.fromJson(decodedResponse));
    } catch (e) {
      return Right('error while connecting');
    }
  }

  static Future<Either<String, String>> uploadImage(File image) async {
    try {
      var url = Uri.parse(baseUrl_api + "/addphoto");
      http.MultipartRequest request = new http.MultipartRequest('POST', url);
      String token = await db.getTokenFromMyIdentity();
      print(token);
      request.headers.addAll({"Authorization": "Bearer $token"});
      request.files.add(await http.MultipartFile.fromPath(
        'imag',
        image.path,
      ));
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode >= 300) return Right('error while connecting');
      print(response.statusCode);
      final respStr = await response.stream.bytesToString();
      var decodedResponse = json.decode(respStr);
      print(decodedResponse);
      return Left(decodedResponse['data']['imag']);
    } catch (e) {
      return Right('error while connecting');
    }
  }

  static Future<Either<String, String>> addProperty(
      PropertyModel params) async {
    try {
      var url = Uri.parse(baseUrl_api + "/creatEstate");
      print(params.toJson());

      String token = await db.getTokenFromMyIdentity();
      print(token);
      var response = await http.post(url,
          body: params.toJson(), headers: {"Authorization": "Bearer $token"});
      print(response.statusCode);
      print(response.body);
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      print(decodedResponse);
      return Left('');
    } catch (e) {
      print(e);
      return Right('error while connecting');
    }
  }

  static Future<Either<PropertyServerModel, String>> getAllProperty() async {
    try {
      var url = Uri.parse(baseUrl_api + "/listEstates");
      String token = await db.getTokenFromMyIdentity();
      print(token);

      var response =
          await http.get(url, headers: {"Authorization": "Bearer $token"});
      print(response.body);
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return Left(PropertyServerModel.fromJson(decodedResponse));
    } catch (e) {
      return Right('error while connecting');
    }
  }

  static Future<Either<MyPropertyServerModel, String>> getMyProperty(
      int id) async {
    try {
      var url = Uri.parse(baseUrl_api + "/getallEstate's/$id");
      String token = await db.getTokenFromMyIdentity();
      print(token);

      var response =
          await http.get(url, headers: {"Authorization": "Bearer $token"});
      print(response.body);
      if (response.body.length < 20) return Right('error while connecting');
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      return Left(MyPropertyServerModel.fromJson(decodedResponse));
    } catch (e) {
      return Right('error while connecting');
    }
  }

  static Future<Either<PropertyServerModel, String>> getMapProperty(
      List<LatLng> li) async {
    if (li.length >= 3) {
      try {
        var url = Uri.parse(baseUrl_api +
            "/searchestateonmap/${li[0].longitude}/${li[0].latitude}/${li[1].longitude}/${li[1].latitude}/${li[2].longitude}/${li[2].latitude}/${li[3].longitude}/${li[3].latitude}");
        String token = await db.getTokenFromMyIdentity();
        print(token);

        var response =
            await http.get(url, headers: {"Authorization": "Bearer $token"});
        print(response.body);
        var decodedResponse =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map;
        if (decodedResponse['success']) {
          return Left(PropertyServerModel.fromJson(decodedResponse));
        } else
          return Right("error while connecting");
      } catch (e) {
        return Right('error while connecting');
      }
    } else
      return Right('error while connecting');
  }

  static Future<Either<PropertyDetailsModel, String>> getPropertyDetails(
      int id) async {
    try {
      var url = Uri.parse(baseUrl_api + "/viewestate/$id");
      String token = await db.getTokenFromMyIdentity();
      print(token);

      var response =
          await http.get(url, headers: {"Authorization": "Bearer $token"});
      print(response.body);
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      return Left(PropertyDetailsModel.fromJson(decodedResponse));
    } catch (e) {
      return Right('error while connecting');
    }
  }

  static Future<Either<String, String>> deleteProperty(int id) async {
    try {
      var url = Uri.parse(baseUrl_api + "/deleteEstate/$id");
      String token = await db.getTokenFromMyIdentity();
      print(token);

      var response =
          await http.delete(url, headers: {"Authorization": "Bearer $token"});
      print(response.body);
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      if (decodedResponse['success'] == true)
        return Left('done');
      else
        return Right('error while connecting');
    } catch (e) {
      return Right('error while connecting');
    }
  }
}
