import 'package:either_dart/either.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/network/client_api.dart';
import 'package:hummus_admin_panel/core/utils/api_url.dart';
import 'package:hummus_admin_panel/feature/attributes/model/attribute_model.dart';

class AttributeRepo {

  Future<Either<String, AttributeModel>> createAttribute(
      {required Attribute attribute, required int status}) async {
      Response? response = await ApiClient.postData(
        ApiUrl.CREATE_ATTRIBUTE,
        {
          "name_ar": attribute.nameAr ?? '',
          "name_en": attribute.nameEn ?? '',
          'name_he': attribute.nameHe ?? '',
          'status': status,
        },
      );
      if (response.statusCode == 200) {
        return Right(AttributeModel.fromJson(response.body));
      } else {
        return Left(response.body['message'] ?? "Unknown Error Occurred");
      }
  }


  Future<Either<String, AttributeModel>> getAttribute() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_ATTRIBUTE);
    if (response.statusCode == 200) {
      return Right(AttributeModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, AttributeModel>> deleteAttribute(int attributeID) async {
    Response? response = await ApiClient.deleteData('${ApiUrl.DELETE_ATTRIBUTE}$attributeID');
    if (response.statusCode == 200) {
      return Right(AttributeModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }
}
