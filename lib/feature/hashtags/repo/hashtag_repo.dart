import 'dart:typed_data';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class HashtagRepo {

  Future<Either<String, HashtagModel>> createHashtag(
      {required Hashtag hashtagModel, Uint8List? webImage}) async {
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

  Future<Either<String, HashtagModel>> updateHashtag(
      {required Hashtag hashtagModel, Uint8List? webImage}) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      'id': hashtagModel.id.toString(),
      'name_ar': hashtagModel.nameAr!,
      'name_en': hashtagModel.nameEn!,
      'name_he': hashtagModel.nameHe!,
      'status': hashtagModel.status.toString(),
    });
    Response? response = await ApiClient.postMultipartData(
      ApiUrl.UPDATE_HASHTAG,
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

  Future<Either<String, HashtagModel>> deleteHashtag(int hashtagID) async {
    Response? response = await ApiClient.deleteData('${ApiUrl.DELETE_HASHTAG}$hashtagID');
    if (response.statusCode == 200) {
      return Right(HashtagModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }

}
