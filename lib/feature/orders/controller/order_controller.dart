import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

import 'package:hummus_admin_panel/feature/orders/model/order_model.dart';

class AllOrderController extends GetxController {
  late AllOrderRepository allOrderRepository;

  AllOrderController(this.allOrderRepository);

  var controllerState = ControllerState.idle.obs;
  final orderDetails = AllOrders().obs;
  final RxBool isLoading = false.obs;

  RxList<AllOrders> allOrderList = <AllOrders>[].obs;

  RxString selectedIndex = ''.obs;
  RxList<AllOrders> waitingList = <AllOrders>[].obs;
  RxList<AllOrders> preparingList = <AllOrders>[].obs;
  RxList<AllOrders> onWayList = <AllOrders>[].obs;
  RxList<AllOrders> rejectedList = <AllOrders>[].obs;
  RxList<AllOrders> waitingDeliveredList = <AllOrders>[].obs;
  RxList<AllOrders> completedList = <AllOrders>[].obs;

  var currentOrderSelected = Rxn<AllOrders>(); // Nullable Rx

  Future<void> getAllOrder(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await allOrderRepository.getAllOrder();
    update();
    result.fold(
      (left) {
        controllerState.value = ControllerState.error;
        ShowSnackBar.show(context: context, message: left, color: Colors.red);
      },
      (right) {
        waitingList.clear();
        rejectedList.clear();
        preparingList.clear();
        waitingDeliveredList.clear();
        completedList.clear();
        controllerState.value = ControllerState.success;
        allOrderList.value = right.data.reversed.toList();

        allOrderList.value = right.data.reversed.toList();
        filterListByStatus(allOrderList);
      },
    );
    update();
  }

  selectOrder(AllOrders allOrders) {
    currentOrderSelected.value = allOrders;
    update();
  }

  String calculateSinceDays(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return 'since ${difference.inDays} days';
    } else if (difference.inHours > 0) {
      return 'since ${difference.inHours} hours';
    } else if (difference.inMinutes > 0) {
      return 'since ${difference.inMinutes} minutes';
    } else {
      return 'just now';
    }
  }

  filterListByStatus(List<AllOrders> allOrdersList) {
    for (AllOrders order in allOrderList) {
      if (order.executionStep == null) {
        waitingList.add(order);
      } else if (order.executionStep == "reject") {
        rejectedList.add(order);
      } else if (order.executionStep == "preparing") {
        preparingList.add(order);
      } else if (order.executionStep == "waiting_delivery") {
        waitingDeliveredList.add(order);
      } else if (order.executionStep == "done") {
        completedList.add(order);
      }
    }
  }

  changeStatusOfOrder(
      int orderId, String taskStatus, BuildContext context) async {
    isLoading.value = true;
    // try {
    final data = await allOrderRepository.changeStatusOfOrder(
        orderId, taskStatus, selectedIndex.value);
    currentOrderSelected.value = null;
    // orderDetails.value.executionStep = data.data[index].executionStep;
    getAllOrder(context);
    // switch (taskStatus) {
    //   case "waiting":
    //     // waitingList
    //     //     .firstWhere((element) => element.id == orderId)
    //     //     .executionStep = data.data[index].executionStep;
    //     isLoading.value = false;
    //     break;
    //   case "preparing":
    //     // preparingList
    //     //     .firstWhere((element) => element.id == orderId)
    //     //     .executionStep = data.data[index].executionStep;
    //     isLoading.value = false;
    //     break;
    //   case "waiting_pickup":
    //     // onWayList
    //     //     .firstWhere((element) => element.id == orderId)
    //     //     .executionStep = data.data[index].executionStep;
    //     isLoading.value = false;
    //     break;
    //   case "waiting_delivery":
    //     // waitingDeliveredList
    //     //     .firstWhere((element) => element.id == orderId)
    //     //     .executionStep = data.data[index].executionStep;
    //     isLoading.value = false;
    //     break;
    //   case "done":
    //     // completedList
    //     //     .firstWhere((element) => element.id == orderId)
    //     //     .executionStep = data.data[index].executionStep;
    //     isLoading.value = false;
    //     break;
    //   default:
    // }    //   isLoading.value = false;
    // } catch (e) {}
  }
}
