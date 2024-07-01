import 'dart:typed_data';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/network/client_api.dart';
import 'package:hummus_admin_panel/core/utils/api_url.dart';
import 'package:hummus_admin_panel/feature/hashtags/model/hashtag_model.dart';
import 'package:image_picker/image_picker.dart';

class HashtagRepo {


  Future<Response?> createHashtag(
      {required Hashtag hashtagModel, XFile? data, Uint8List? webImage}) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      'name_ar': hashtagModel.nameAr!,
      'name_en': hashtagModel.nameEn!,
      'name_he': hashtagModel.nameHe!,
      'status': hashtagModel.status.toString(),
    });
    return await ApiClient.postMultipartData(
      ApiUrl.CREATE_HASHTAG,
      _body,
      [MultipartBody('image', webImage: webImage)],
    );
  }

  Future<Response> getHashtag() async {
    return await ApiClient.getData(ApiUrl.GET_HASHTAG);
  }
}
