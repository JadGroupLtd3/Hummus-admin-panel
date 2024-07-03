import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class DeliveryTimeController extends GetxController {
  late DeliveryTimeRepo deliveryTimeRepo;

  DeliveryTimeController(this.deliveryTimeRepo);

  var controllerState = ControllerState.idle.obs;

  RxBool workStatus_1 = false.obs;
  RxBool workStatus_2 = false.obs;
  RxBool workStatus_3 = false.obs;
  RxBool workStatus_4 = false.obs;
  RxBool workStatus_5 = false.obs;
  RxBool workStatus_6 = false.obs;
  RxBool workStatus_7 = false.obs;

  TextEditingController from_1 = TextEditingController();
  TextEditingController to_1 = TextEditingController();
  TextEditingController from_2 = TextEditingController();
  TextEditingController to_2 = TextEditingController();
  TextEditingController from_3 = TextEditingController();
  TextEditingController to_3 = TextEditingController();
  TextEditingController from_4 = TextEditingController();
  TextEditingController to_4 = TextEditingController();
  TextEditingController from_5 = TextEditingController();
  TextEditingController to_5 = TextEditingController();
  TextEditingController from_6 = TextEditingController();
  TextEditingController to_6 = TextEditingController();
  TextEditingController from_7 = TextEditingController();
  TextEditingController to_7 = TextEditingController();

  Rx<DeliveryTimeModel?> deliveryTime = Rx<DeliveryTimeModel?>(null);
  RxList<DeliveryTime> deliveryTimeList = <DeliveryTime>[].obs;

  initTextController() {
    from_1.clear();
    to_1.clear();
    from_2.clear();
    to_2.clear();
    from_3.clear();
    to_3.clear();
    from_4.clear();
    to_4.clear();
    from_5.clear();
    to_5.clear();
    from_6.clear();
    to_6.clear();
    from_7.clear();
    to_7.clear();
  }

  initDeliveryTime(DeliveryTimeModel deliveryTime) {
    initTextController();
    from_1.text = deliveryTime.data.firstWhere((element) => element.day == "1").from;
    to_1.text = deliveryTime.data.firstWhere((element) => element.day == "1").to;
    workStatus_1.value =
        deliveryTime.data.firstWhere((element) => element.day == "1").status == 1
            ? true
            : false;
    from_2.text = deliveryTime.data.firstWhere((element) => element.day == "2").from;
    to_2.text = deliveryTime.data.firstWhere((element) => element.day == "2").to;
    workStatus_2.value =
        deliveryTime.data.firstWhere((element) => element.day == "2").status == 1
            ? true
            : false;
    from_3.text = deliveryTime.data.firstWhere((element) => element.day == "3").from;
    to_3.text = deliveryTime.data.firstWhere((element) => element.day == "3").to;
    workStatus_3.value =
        deliveryTime.data.firstWhere((element) => element.day == "3").status == 1
            ? true
            : false;
    from_4.text = deliveryTime.data.firstWhere((element) => element.day == "4").from;
    to_4.text = deliveryTime.data.firstWhere((element) => element.day == "4").to;
    workStatus_4.value =
        deliveryTime.data.firstWhere((element) => element.day == "4").status == 1
            ? true
            : false;
    from_5.text =
        deliveryTime.data.firstWhere((element) => element.day == "5").from;
    to_5.text =
        deliveryTime.data.firstWhere((element) => element.day == "5").to;
    workStatus_5.value =
        deliveryTime.data.firstWhere((element) => element.day == "5").status == 1
            ? true
            : false;
    from_6.text = deliveryTime.data.firstWhere((element) => element.day == "6").from;
    to_6.text = deliveryTime.data.firstWhere((element) => element.day == "6").to;
    workStatus_6.value =
    deliveryTime.data.firstWhere((element) => element.day == "6").status == 1
            ? true
            : false;
    from_7.text = deliveryTime.data.firstWhere((element) => element.day == "7").from;
    to_7.text = deliveryTime.data.firstWhere((element) => element.day == "7").to;
    workStatus_7.value =
        deliveryTime.data.firstWhere((element) => element.day == "7").status == 1
            ? true
            : false;
  }

  Future<void> createDeliveryTime(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await deliveryTimeRepo.createDeliveryTime(
      from_1: from_1.text,
      to_1: to_1.text,
      workStatus_1: workStatus_1.value == true ? 1 : 0,
      from_2: from_2.text,
      to_2: to_2.text,
      workStatus_2: workStatus_2.value == true ? 1 : 0,
      from_3: from_3.text,
      to_3: to_3.text,
      workStatus_3: workStatus_3.value == true ? 1 : 0,
      from_4: from_4.text,
      to_4: to_4.text,
      workStatus_4: workStatus_4.value == true ? 1 : 0,
      from_5: from_5.text,
      to_5: to_5.text,
      workStatus_5: workStatus_5.value == true ? 1 : 0,
      from_6: from_6.text,
      to_6: to_6.text,
      workStatus_6: workStatus_6.value == true ? 1 : 0,
      from_7: from_7.text,
      to_7: to_7.text,
      workStatus_7: workStatus_7.value == true ? 1 : 0,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(
          context: context, message: right.message, color: Colors.green);
      getDeliveryTime(context);

      update();
    });
  }

  Future<void> getDeliveryTime(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await deliveryTimeRepo.getDeliveryTime();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      deliveryTime.value = right;
      deliveryTimeList.value = right.data;
    });
  }
}
