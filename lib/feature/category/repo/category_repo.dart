import 'dart:typed_data';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/network/client_api.dart';
import 'package:hummus_admin_panel/core/utils/api_url.dart';
import 'package:hummus_admin_panel/feature/category/model/category_model.dart';
import 'package:image_picker/image_picker.dart';

class CategoryRepo {


  Future<Response?> createCategory(
      {required Category categoryModel, XFile? data, Uint8List? webImage}) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      'name_ar': categoryModel.nameAr!,
      'name_en': categoryModel.nameEn!,
      'name_he': categoryModel.nameHe!,
      'status': categoryModel.status.toString(),
      'sort': categoryModel.sort.toString(),
    });
    return await ApiClient.postMultipartData(
      ApiUrl.CREATE_CATEGORY,
      _body,
      [MultipartBody('image', webImage: webImage)],
    );
  }

  Future<Response> getCategory() async {
    return await ApiClient.getData(ApiUrl.GET_CATEGORY);
  }
}
