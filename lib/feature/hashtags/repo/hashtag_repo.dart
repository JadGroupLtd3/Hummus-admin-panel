import 'dart:typed_data';

import 'package:either_dart/either.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/network/client_api.dart';
import 'package:hummus_admin_panel/core/utils/api_url.dart';
import 'package:hummus_admin_panel/feature/hashtags/model/hashtag_model.dart';
import 'package:image_picker/image_picker.dart';

class HashtagRepo {

  Future<Either<String, HashtagModel>> createHashtag(
      {required Hashtag hashtagModel, XFile? data, Uint8List? webImage}) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      'name_ar': hashtagModel.nameAr!,
      'name_en': hashtagModel.nameEn!,
      'name_he': hashtagModel.nameHe!,
      'status': hashtagModel.status.toString(),
    });
    Response? response = await ApiClient.postMultipartData(
      ApiUrl.CREATE_HASHTAG,
      _body,
      [MultipartBody('image', webImage: webImage)],
    );
    if (response.statusCode == 200) {
      return Right(HashtagModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, HashtagModel>> getHashtag() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_HASHTAG);
    if (response.statusCode == 200) {
      return Right(HashtagModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }


}
