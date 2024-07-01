import 'dart:typed_data';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/network/client_api.dart';
import 'package:hummus_admin_panel/core/utils/api_url.dart';
import 'package:hummus_admin_panel/feature/attributes/model/attribute_model.dart';
import 'package:hummus_admin_panel/feature/category/model/category_model.dart';
import 'package:image_picker/image_picker.dart';

class AttributeRepo {


  Future<Response?> createAttribute(
      {required Attribute attribute,required int status}) async {
    return await ApiClient.postData(
      ApiUrl.CREATE_ATTRIBUTE,
      {
        "name_ar": attribute.nameAr!,
        "name_en": attribute.nameEn!,
        'name_he': attribute.nameHe!,
        'status': status,
      },
    );
  }

  Future<Response> getAttribute() async {
    return await ApiClient.getData(ApiUrl.GET_ATTRIBUTE);
  }
}
