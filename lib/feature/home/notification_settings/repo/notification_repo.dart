import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/model/notification_model.dart';

class NotificationRepo{

  Future<Either<String, NotificationModel>> createNotificationStatus({
    required NotificationData notificationModel}) async {
    Response? response = await ApiClient.postData(
      ApiUrl.UPDATE_NOTIFICATION,
      {'new_order_status': notificationModel.newOrderStatus,
        'new_order_message_ar': notificationModel.newOrderMessageAr,
        'new_order_message_en': notificationModel.newOrderMessageEn,
        'new_order_message_he': notificationModel.newOrderMessageHe,
        'order_accept_status': notificationModel.orderAcceptStatus,
        'order_accept_message_ar': notificationModel.orderAcceptMessageAr,
        'order_accept_message_en': notificationModel.orderAcceptMessageEn,
        'order_accept_message_he': notificationModel.orderAcceptMessageHe,
        'order_reject_status': notificationModel.orderRejectStatus,
        'order_reject_message_ar': notificationModel.orderRejectMessageAr,
        'order_reject_message_en': notificationModel.orderRejectMessageEn,
        'order_reject_message_he': notificationModel.orderRejectMessageHe,
        'order_preparing_status': notificationModel.orderPreparingStatus,
        'order_preparing_message_ar': notificationModel.orderPreparingMessageAr,
        'order_preparing_message_en': notificationModel.orderPreparingMessageEn,
        'order_preparing_message_he': notificationModel.orderPreparingMessageHe,
        'order_waiting_pickup_status': notificationModel.orderWaitingPickupStatus,
        'order_waiting_pickup_message_ar': notificationModel.orderWaitingPickupMessageAr,
        'order_waiting_pickup_message_en': notificationModel.orderWaitingPickupMessageEn,
        'order_waiting_pickup_message_he': notificationModel.orderWaitingPickupMessageHe,
        'order_waiting_delivery_status': notificationModel.orderWaitingDeliveryStatus,
        'order_waiting_delivery_message_ar': notificationModel.orderWaitingDeliveryMessageAr,
        'order_waiting_delivery_message_eh': notificationModel.orderWaitingDeliveryMessageEn,
        'order_waiting_delivery_message_he': notificationModel.orderWaitingDeliveryMessageHe,
        'order_on_the_way_status': notificationModel.orderOnTheWayStatus,
        'order_on_the_way_message_ar': notificationModel.orderOnTheWayMessageAr,
        'order_on_the_way_message_en': notificationModel.orderOnTheWayMessageEn,
        'order_on_the_way_message_he': notificationModel.orderOnTheWayMessageHe,
        'order_done_status': notificationModel.orderDoneStatus,
        'order_done_message_ar': notificationModel.orderDoneMessageAr,
        'order_done_message_en': notificationModel.orderDoneMessageEn,
        'order_done_message_he': notificationModel.orderDoneMessageHe,
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(NotificationModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, NotificationModel>> updateNotificationStatus({
    required notificationKey,required notificationValue}) async {
    Response? response = await ApiClient.postData(
      ApiUrl.UPDATE_STATUS_NOTIFICATION,
      {'key': notificationKey, 'value': notificationValue,},
    );
    if (response.statusCode == 200) {
      return Right(NotificationModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

  Future<Either<String, NotificationModel>> getNotification() async {
    Response? response = await ApiClient.getData(ApiUrl.GET_NOTIFICATION);
    if (response.statusCode == 200) {
      return Right(NotificationModel.fromJson(response.body));
    } else {
      return Left(response.body['message'] ?? "Unknown Error Occurred");
    }
  }

}