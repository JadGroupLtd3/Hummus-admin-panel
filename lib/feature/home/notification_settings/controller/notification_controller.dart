import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/model/notification_model.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/repo/notification_repo.dart';

class NotificationController extends GetxController {
  late NotificationRepo notificationRepo;

  NotificationController(this.notificationRepo);

  var controllerState = ControllerState.idle.obs;

  RxBool newOrderStatus = false.obs;
  RxBool requestAcceptStatus = false.obs;
  RxBool rejectionOfTheApplicationStatus = false.obs;
  RxBool executeTheRequestStatus = false.obs;
  RxBool pickupFromTheStoreStatus = false.obs;
  RxBool waitingToReceiveTheDeliveryStatus = false.obs;
  RxBool onMyWayStatus = false.obs;
  RxBool doneStatus = false.obs;
  Rx<NotificationData?> notificationData = Rx<NotificationData?>(null);

  final GlobalKey<FormState> notificationArKey = GlobalKey<FormState>();
  final GlobalKey<FormState> notificationEnKey = GlobalKey<FormState>();
  final GlobalKey<FormState> notificationHeKey = GlobalKey<FormState>();

  TextEditingController newOrderTextArabic = TextEditingController();
  TextEditingController acceptOrderTextArabic = TextEditingController();
  TextEditingController rejectOrderArabic = TextEditingController();
  TextEditingController preparingOrderArabic = TextEditingController();
  TextEditingController pickupOrderArabic = TextEditingController();
  TextEditingController deliveryOrderArabic = TextEditingController();
  TextEditingController onWayOrderArabic = TextEditingController();
  TextEditingController doneOrderArabic = TextEditingController();

  TextEditingController newOrderTextEnglish = TextEditingController();
  TextEditingController acceptOrderTextEnglish = TextEditingController();
  TextEditingController rejectOrderEnglish = TextEditingController();
  TextEditingController preparingOrderEnglish = TextEditingController();
  TextEditingController pickupOrderEnglish = TextEditingController();
  TextEditingController deliveryOrderEnglish = TextEditingController();
  TextEditingController onWayOrderEnglish = TextEditingController();
  TextEditingController doneOrderEnglish = TextEditingController();

  TextEditingController newOrderTextHebrew = TextEditingController();
  TextEditingController acceptOrderTextHebrew = TextEditingController();
  TextEditingController rejectOrderHebrew = TextEditingController();
  TextEditingController preparingOrderHebrew = TextEditingController();
  TextEditingController pickupOrderHebrew = TextEditingController();
  TextEditingController deliveryOrderHebrew = TextEditingController();
  TextEditingController onWayOrderHebrew = TextEditingController();
  TextEditingController doneOrderHebrew = TextEditingController();

  void isEdit(NotificationData notificationData) {
    newOrderStatus.value = notificationData.newOrderStatus == 1 ? true : false;
    requestAcceptStatus.value =
        notificationData.orderAcceptStatus == 1 ? true : false;
    rejectionOfTheApplicationStatus.value =
        notificationData.orderRejectStatus == 1 ? true : false;
    executeTheRequestStatus.value =
        notificationData.orderPreparingStatus == 1 ? true : false;
    pickupFromTheStoreStatus.value =
        notificationData.orderWaitingPickupStatus == 1 ? true : false;
    waitingToReceiveTheDeliveryStatus.value =
        notificationData.orderWaitingDeliveryStatus == 1 ? true : false;
    onMyWayStatus.value =
        notificationData.orderOnTheWayStatus == 1 ? true : false;
    doneStatus.value = notificationData.orderDoneStatus == 1 ? true : false;
    newOrderTextArabic.text = notificationData.newOrderMessageAr;
    acceptOrderTextArabic.text = notificationData.orderAcceptMessageAr;
    rejectOrderArabic.text = notificationData.orderRejectMessageAr;
    preparingOrderArabic.text = notificationData.orderPreparingMessageAr;
    pickupOrderArabic.text = notificationData.orderWaitingPickupMessageAr;
    deliveryOrderArabic.text = notificationData.orderWaitingDeliveryMessageAr;
    onWayOrderArabic.text = notificationData.orderOnTheWayMessageAr;
    doneOrderArabic.text = notificationData.orderDoneMessageAr;
    newOrderTextEnglish.text = notificationData.newOrderMessageEn;
    acceptOrderTextEnglish.text = notificationData.orderAcceptMessageEn;
    rejectOrderEnglish.text = notificationData.orderRejectMessageEn;
    preparingOrderEnglish.text = notificationData.orderPreparingMessageEn;
    pickupOrderEnglish.text = notificationData.orderWaitingPickupMessageEn;
    deliveryOrderEnglish.text = notificationData.orderWaitingDeliveryMessageEn ?? 'Not Found';
    onWayOrderEnglish.text = notificationData.orderOnTheWayMessageEn;
    doneOrderEnglish.text = notificationData.orderDoneMessageEn;
    newOrderTextHebrew.text = notificationData.newOrderMessageHe;
    acceptOrderTextHebrew.text = notificationData.orderAcceptMessageHe;
    rejectOrderHebrew.text = notificationData.orderRejectMessageHe;
    preparingOrderHebrew.text = notificationData.orderPreparingMessageHe;
    pickupOrderHebrew.text = notificationData.orderWaitingPickupMessageHe;
    deliveryOrderHebrew.text = notificationData.orderWaitingDeliveryMessageHe;
    onWayOrderHebrew.text = notificationData.orderOnTheWayMessageHe;
    doneOrderHebrew.text = notificationData.orderDoneMessageHe;
  }

  Future<void> createNotificationStatus(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final NotificationData notificationModel = NotificationData(
      newOrderStatus: newOrderStatus.value == true ? 1 : 0,
      newOrderMessageAr: newOrderTextArabic.text,
      newOrderMessageEn: newOrderTextEnglish.text,
      newOrderMessageHe: newOrderTextHebrew.text,
      orderAcceptStatus: requestAcceptStatus.value == true ? 1 : 0,
      orderAcceptMessageAr: acceptOrderTextArabic.text,
      orderAcceptMessageEn: acceptOrderTextEnglish.text,
      orderAcceptMessageHe: acceptOrderTextHebrew.text,
      orderRejectStatus: rejectionOfTheApplicationStatus.value == true ? 1 : 0,
      orderRejectMessageAr: rejectOrderArabic.text,
      orderRejectMessageEn: rejectOrderEnglish.text,
      orderRejectMessageHe: rejectOrderHebrew.text,
      orderPreparingStatus: executeTheRequestStatus.value == true ? 1 : 0,
      orderPreparingMessageAr: preparingOrderArabic.text,
      orderPreparingMessageEn: preparingOrderEnglish.text,
      orderPreparingMessageHe: preparingOrderHebrew.text,
      orderWaitingPickupStatus: pickupFromTheStoreStatus.value == true ? 1 : 0,
      orderWaitingPickupMessageAr: pickupOrderArabic.text,
      orderWaitingPickupMessageEn: pickupOrderEnglish.text,
      orderWaitingPickupMessageHe: pickupOrderHebrew.text,
      orderWaitingDeliveryStatus: waitingToReceiveTheDeliveryStatus.value == true ? 1 : 0,
      orderWaitingDeliveryMessageAr: deliveryOrderArabic.text,
      orderWaitingDeliveryMessageEn: deliveryOrderEnglish.text,
      orderWaitingDeliveryMessageHe: deliveryOrderHebrew.text,
      orderOnTheWayStatus: onMyWayStatus.value == true ? 1 : 0,
      orderOnTheWayMessageAr: onWayOrderArabic.text,
      orderOnTheWayMessageEn: onWayOrderEnglish.text,
      orderOnTheWayMessageHe: onWayOrderHebrew.text,
      orderDoneStatus: doneStatus.value == true ? 1 : 0,
      orderDoneMessageAr: doneOrderArabic.text,
      orderDoneMessageEn: doneOrderEnglish.text,
      orderDoneMessageHe: doneOrderHebrew.text,
    );
    final result = await notificationRepo.createNotificationStatus(
      notificationModel: notificationModel,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(
          context: context, message: 'Updated'.tr, color: Colors.green);
      getNotification(context);
      update();
    });
  }

  Future<void> updateNotificationStatus(BuildContext context,
      {required key, required value}) async {
    controllerState.value = ControllerState.loading;
    final result = await notificationRepo.updateNotificationStatus(
      notificationKey: key,
      notificationValue: value,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(
          context: context, message: 'Updated'.tr, color: Colors.green);
      getNotification(context);
      update();
    });
  }

  Future<void> getNotification(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await notificationRepo.getNotification();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      notificationData.value = right.data;
    });
  }
}
