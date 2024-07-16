import 'dart:typed_data';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/show_notifications/model/push_notification_model.dart';



class PushNotificationRepo{
  Future<Either<String, PushNotificationModel>> createPushNotification(
      {required PushNotification pushNotification,
      required int typeId,
      required Uint8List? webImageBytesAr,
      required Uint8List? webImageBytesEn,
      required Uint8List? webImageBytesHe}) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      "type": pushNotification.type,
      "type_id": typeId.toString(),
      "title_ar": pushNotification.titleAr,
      "title_en": pushNotification.titleEn,
      "title_he": pushNotification.titleHe,
      "description_ar": pushNotification.descriptionAr,
      "description_en": pushNotification.descriptionEn,
      "description_he": pushNotification.descriptionHe,
    });
    Response? response = await ApiClient.postMultipartData(
      ApiUrl.CREATE_NOTIFICATION_DASHBOARD,
      _body,
      [
        MultipartBody('image_ar', webImage: webImageBytesAr),
        MultipartBody('image_en', webImage: webImageBytesEn),
        MultipartBody('image_he', webImage: webImageBytesHe),
      ],
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(PushNotificationModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }


  Future<Either<String, PushNotificationMealsModel>> getNotificationMeals() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_MEALS_NOTIFICATION);
    if (response.statusCode == 200) {
      return Right(PushNotificationMealsModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, PushNotificationCategoryModel>> getNotificationCategory() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_CATEGORY_NOTIFICATION);
    if (response.statusCode == 200) {
      return Right(PushNotificationCategoryModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, PushNotificationModel>> getPushNotification() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_NOTIFICATION_DASHBOARD);
    if (response.statusCode == 200) {
      return Right(PushNotificationModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

}