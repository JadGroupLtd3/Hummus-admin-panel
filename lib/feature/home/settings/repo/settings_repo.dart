import 'dart:typed_data';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/settings/model/settings_model.dart';

class SettingsRepo {

  Future<Either<String, CreateSettingsModel>> createSettings(
      {required SettingsData settingsData,Uint8List? webImage}) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      "app_name" : settingsData.appName,
      "delivery_price" : settingsData.deliveryPrice,
      "phone" : settingsData.phone,
      "email" : settingsData.email,
      "tax_number" : settingsData.taxNumber,
      "address" : settingsData.address,
      "fax" : settingsData.fax,
      "facebook" : settingsData.facebook,
      "twitter" : settingsData.twitter,
      "instagram" : settingsData.instagram,
      "tiktok" : settingsData.tiktok,
      "google" : settingsData.google,
      "whatsapp" : settingsData.whatsapp,
      "drink_cat_id" : settingsData.drinkCatId.toString(),
    });
    Response? response = await ApiClient.postMultipartData(
      ApiUrl.CREATE_SETTINGS,
      _body,
      [MultipartBody('logo', webImage: webImage)],
    );
    if (response.statusCode == 200) {
      return Right(CreateSettingsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, SettingsModel>> getSettings() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_SETTINGS);
    if (response.statusCode == 200) {
      return Right(SettingsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }
}
