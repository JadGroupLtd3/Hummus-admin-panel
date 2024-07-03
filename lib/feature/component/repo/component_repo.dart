import 'dart:typed_data';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class ComponentRepo {

  Future<Either<String, ComponentModel>> createComponent(
      {required Component componentModel, XFile? data, Uint8List? webImage}) async {
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
