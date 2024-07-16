import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/show_notifications/model/push_notification_model.dart';

class PushNotificationController extends GetxController {
  late PushNotificationRepo pushNotificationRepo;

  PushNotificationController(this.pushNotificationRepo);

  var controllerState = ControllerState.idle.obs;
  XFile? pickedProfileImageFileAr;
  Uint8List webImageAr = Uint8List(8);
  XFile? pickedProfileImageFileEn;
  Uint8List webImageEn = Uint8List(8);
  XFile? pickedProfileImageFileHe;
  Uint8List webImageHe = Uint8List(8);
  TextEditingController titleNotificationAr = TextEditingController();
  TextEditingController titleNotificationEn = TextEditingController();
  TextEditingController titleNotificationHe = TextEditingController();
  TextEditingController descriptionNotificationAr = TextEditingController();
  TextEditingController descriptionNotificationEn = TextEditingController();
  TextEditingController descriptionNotificationHe = TextEditingController();

  final GlobalKey<FormState> notificationKeyAr = GlobalKey<FormState>();
  final GlobalKey<FormState> notificationKeyEn = GlobalKey<FormState>();
  final GlobalKey<FormState> notificationKeyHe = GlobalKey<FormState>();

  RxList<PushNotification> pushNotificationList = <PushNotification>[].obs;
  RxList<PushNotificationMeals> mealsNotificationList = <PushNotificationMeals>[].obs;
  RxList<PushNotificationCategory> categoryNotificationList = <PushNotificationCategory>[].obs;

  RxString type = ''.obs;
  RxInt typeId = 0.obs;

  initState(){
    type.value = '';
    typeId.value = 0;
    titleNotificationAr.clear();
    titleNotificationEn.clear();
    titleNotificationHe.clear();
    descriptionNotificationAr.clear();
    descriptionNotificationEn.clear();
    descriptionNotificationHe.clear();
    pickedProfileImageFileAr = null;
    pickedProfileImageFileEn = null;
    pickedProfileImageFileHe = null;
  }

  Future<void> createPushNotification(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    PushNotification pushNotification = PushNotification(
      titleAr: titleNotificationAr.text,
      titleEn: titleNotificationEn.text,
      titleHe: titleNotificationHe.text,
      descriptionAr: descriptionNotificationAr.text,
      descriptionEn: descriptionNotificationEn.text,
      descriptionHe: descriptionNotificationHe.text,
      imageAr: pickedProfileImageFileAr?.path ?? '',
      imageEn: pickedProfileImageFileEn?.path ?? '',
      imageHe: pickedProfileImageFileHe?.path ?? '',
      type: type.value,
    );
    final result = await pushNotificationRepo.createPushNotification(
    pushNotification: pushNotification,
    typeId: typeId.value,
    webImageBytesAr: webImageAr,
    webImageBytesEn: webImageEn,
    webImageBytesHe: webImageHe,
    );
    result.fold((left) {
    controllerState.value = ControllerState.error;
    ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
    controllerState.value = ControllerState.success;
    Navigator.pop(context);
    ShowSnackBar.show(context: context, message: 'Send successfully'.tr, color: Colors.green);
    getPushNotification(context);
    initState();
    update();
    });
  }

  Future<void> getNotificationMeals(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await pushNotificationRepo.getNotificationMeals();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      mealsNotificationList.value = right.data;
    });
  }

  Future<void> getNotificationCategory(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await pushNotificationRepo.getNotificationCategory();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      categoryNotificationList.value = right.data;
    });
  }

  Future<void> getPushNotification(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await pushNotificationRepo.getPushNotification();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      pushNotificationList.value = right.data;
    });
  }
}