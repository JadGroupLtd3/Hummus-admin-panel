import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';

class ComponentRepo {

  var headers = {
    'content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${PrefsHelper.getToken()}'
  };

  Future<Either<String, ComponentModel>> createComponent(
      {required Component componentModel, Uint8List? webImage}) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      'name_ar': componentModel.nameAr!,
      'name_en': componentModel.nameEn!,
      'name_he': componentModel.nameHe!,
      'status': componentModel.status.toString(),
    });
    Response? response = await ApiClient.postMultipartData(
      ApiUrl.CREATE_COMPONENT,
      _body,
      [MultipartBody('image', webImage: webImage)],
    );
    if (response.statusCode == 200) {
      return Right(ComponentModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, ComponentModel>> updateComponent2(
      {required Component componentModel, Uint8List? webImage}) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      'id': componentModel.id.toString(),
      'name_ar': componentModel.nameAr!,
      'name_en': componentModel.nameEn!,
      'name_he': componentModel.nameHe!,
      'status': componentModel.status.toString(),
    });
    Response? response = await ApiClient.postMultipartData(
      ApiUrl.UPDATE_COMPONENT,
      _body,
      [MultipartBody('image', webImage: webImage)],
    );
    if (response.statusCode == 200) {
      return Right(ComponentModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, ComponentModel>> updateComponent(
      {required Component componentModel, required Uint8List? webImageBytes}) async {
    var url = Uri.parse('${ApiUrl.BASE_URL}${ApiUrl.UPDATE_COMPONENT}');
    var request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    request.fields.addAll({
      'id': componentModel.id.toString(),
      'name_ar': componentModel.nameAr!,
      'name_en': componentModel.nameEn!,
      'name_he': componentModel.nameHe!,
      'status': componentModel.status.toString(),
    });
    if(componentModel.image != '' || componentModel.image != null){
      if (!kIsWeb) {
        request.fields['image'] = componentModel.image!;
        request.files.add(await http.MultipartFile.fromPath('image', componentModel.image!));
      } else if (webImageBytes != null) {
        request.files.add(http.MultipartFile.fromBytes(
          'image',
          webImageBytes,
          filename: 'image.jpg',
          contentType: MediaType('image', 'jpeg'),
        ));
      }
    }
    try {
      var streamedResponse = await request.send();
      if (streamedResponse.statusCode == 200) {
        var response = await http.Response.fromStream(streamedResponse);
        print(response.body);
        return Right(ComponentModel.fromJson(jsonDecode(response.body)));
      } else {
        var errorResponse = await http.Response.fromStream(streamedResponse);
        var responseBody = jsonDecode(errorResponse.body);
        print(responseBody);
        var errorMessage = responseBody['message'] ?? "Unknown Error Occurred";
        return Left(errorMessage);
      }
    } catch (e) {
      return Left("Network error occurred: $e");
    }
  }

  Future<Either<String, ComponentModel>> getComponent() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_COMPONENT);
    if (response.statusCode == 200) {
      return Right(ComponentModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, ComponentModel>> deleteComponent(int componentID) async {
    Response? response = await ApiClient.deleteData('${ApiUrl.DELETE_COMPONENT}$componentID');
    if (response.statusCode == 200) {
      return Right(ComponentModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }

}
