import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/orders/Repo/order_repo.dart';
import 'package:hummus_admin_panel/feature/orders/model/order_model.dart';

class AllOrderController extends GetxController {
  late AllOrderRepository allOrderRepository;

  AllOrderController(this.allOrderRepository);

  var controllerState = ControllerState.idle.obs;
  final orderDetails = AllOrders().obs;
  final RxBool isLoading = false.obs;

  RxList<AllOrders> allOrderList = <AllOrders>[].obs;

  RxString selectedIndex = ''.obs;

  Future<void> getAllOrder(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await allOrderRepository.getAllOrder();
    update();
    result.fold((left) {
        controllerState.value = ControllerState.error;
        ShowSnackBar.show(context: context, message: left, color: Colors.red);
      },
      (right) {
        controllerState.value = ControllerState.success;
        allOrderList.value = right.data.reversed.toList();
      },
    );
    update();
  }

  changeStatusOfOrder(
      int orderId, String taskStatus, BuildContext context) async {
    isLoading.value = true;
    try {
      final data = await allOrderRepository.changeStatusOfOrder(
          orderId, taskStatus, selectedIndex.value);
      // orderDetails.value.executionStep = data.data[index].executionStep;
      getAllOrder(context);
      switch (taskStatus) {
        case "waiting":
          // waitingList
          //     .firstWhere((element) => element.id == orderId)
          //     .executionStep = data.data[index].executionStep;
          isLoading.value = false;
          break;
        case "preparing":
          // preparingList
          //     .firstWhere((element) => element.id == orderId)
          //     .executionStep = data.data[index].executionStep;
          isLoading.value = false;
          break;
        case "waiting_pickup":
          // onWayList
          //     .firstWhere((element) => element.id == orderId)
          //     .executionStep = data.data[index].executionStep;
          isLoading.value = false;
          break;
        case "waiting_delivery":
          // waitingDeliveredList
          //     .firstWhere((element) => element.id == orderId)
          //     .executionStep = data.data[index].executionStep;
          isLoading.value = false;
          break;
        case "done":
          // completedList
          //     .firstWhere((element) => element.id == orderId)
          //     .executionStep = data.data[index].executionStep;
          isLoading.value = false;
          break;
        default:
      }
      isLoading.value = false;
    } catch (e) {}
  }
}
