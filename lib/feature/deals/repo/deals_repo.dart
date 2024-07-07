import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';


class DealsRepo {

  Future<Either<String, DealsModel>> createDeals(
      CreateDealModel dealModel, Uint8List? webImageBytes) async {
    var arJson = {
      "name": dealModel.ar.name,
      "description": dealModel.ar.description,
      "image": dealModel.ar.image,
    };
    var enJson = {
      "name": dealModel.en.name,
      "description": dealModel.en.description,
      "image": dealModel.en.image,
    };
    var heJson = {
      "name": dealModel.he.name,
      "description": dealModel.he.description,
      "image": dealModel.he.image,
    };
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      "start_date": dealModel.startDate,
      "end_date": dealModel.endDate,
      "user_use_count": dealModel.userUseCount.toString(),
      "total_price": dealModel.totalPrice.toString(),
      "ar": arJson.toString(),
      "en": enJson.toString(),
      "he": heJson.toString(),
      "status": dealModel.status.toString(),
    });
    _body.addAll(dealModel.decodeMeals());
    Response? response = await ApiClient.postMultipartData(
      ApiUrl.CREATE_DEALS,
      _body,
      [MultipartBody('image', webImage: webImageBytes)],
    );
    print(_body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(DealsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }


  Future<Either<String, DealsModel>> getDeals() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_DEALS);
    if (response.statusCode == 200) {
      return Right(DealsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, DealsModel>> deleteDeals(int dealID) async {
    Response? response =
        await ApiClient.deleteData('${ApiUrl.DELETE_DEALS}$dealID');
    if (response.statusCode == 200) {
      return Right(DealsModel.fromJson(response.body));
    } else {
      print('Api Error ${response.statusCode} . ${response.body}//////////');
      return Left(response.body['message'] ?? "unknown Error Occurred");
    }
  }
}
