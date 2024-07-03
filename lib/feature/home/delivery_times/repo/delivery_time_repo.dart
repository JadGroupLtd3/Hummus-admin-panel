import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class DeliveryTimeRepo {

  Future<Either<String, DeliveryTimeModel>> createDeliveryTime(
      {
        required String from_1, required String to_1, required int workStatus_1,
        required String from_2, required String to_2, required int workStatus_2,
        required String from_3, required String to_3, required int workStatus_3,
        required String from_4, required String to_4, required int workStatus_4,
        required String from_5, required String to_5, required int workStatus_5,
        required String from_6, required String to_6, required int workStatus_6,
        required String from_7, required String to_7, required int workStatus_7,
      }) async {
    Response? response = await ApiClient.postData(
      ApiUrl.CREATE_DELIVERY_TIME,
      {
        "day_1": 1,
        "from_1": from_1,
        "to_1": to_1,
        "work_status_1": workStatus_1,
        "day_2": 2,
        "from_2": from_2,
        "to_2": to_2,
        "work_status_2": workStatus_2,
        "day_3": 3,
        "from_3": from_3,
        "to_3": to_3,
        "work_status_3": workStatus_3,
        "day_4": 4,
        "from_4": from_4,
        "to_4": to_4,
        "work_status_4": workStatus_4,
        "day_5": 5,
        "from_5": from_5,
        "to_5": to_5,
        "work_status_5": workStatus_5,
        "day_6": 6,
        "from_6": from_6,
        "to_6": to_6,
        "work_status_6": workStatus_6,
        "day_7": 7,
        "from_7": from_7,
        "to_7": to_7,
        "work_status_7": workStatus_7,
      },
    );
    if (response.statusCode == 200) {
      return Right(DeliveryTimeModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, DeliveryTimeModel>> getDeliveryTime() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_DELIVERY_TIME);
    if (response.statusCode == 200) {
      return Right(DeliveryTimeModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }
}
