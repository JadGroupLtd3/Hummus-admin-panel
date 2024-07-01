import 'dart:typed_data';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/network/client_api.dart';
import 'package:hummus_admin_panel/core/utils/api_url.dart';
import 'package:hummus_admin_panel/feature/category/model/category_model.dart';
import 'package:hummus_admin_panel/feature/component/model/component_model.dart';
import 'package:image_picker/image_picker.dart';

class ComponentRepo {


  Future<Response?> createComponent(
      {required Component componentModel, XFile? data, Uint8List? webImage}) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      'name_ar': componentModel.nameAr!,
      'name_en': componentModel.nameEn!,
      'name_he': componentModel.nameHe!,
      'status': componentModel.status.toString(),
    });
    return await ApiClient.postMultipartData(
      ApiUrl.CREATE_COMPONENT,
      _body,
      [MultipartBody('image', webImage: webImage)],
    );
  }

  Future<Response> getComponent() async {
    return await ApiClient.getData(ApiUrl.GET_COMPONENT);
  }
}
