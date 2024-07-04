import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class DealsController extends GetxController {
  late DealsRepo dealsRepo;

  DealsController(this.dealsRepo);

  var controllerState = ControllerState.idle.obs;
  RxList<Deals> dealsList = <Deals>[].obs;

  Future<void> getDeals(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await dealsRepo.getDeals();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      dealsList.value = right.data;
    });
  }

  Future<void> deleteDeals(BuildContext context,{required int dealID}) async {
    controllerState.value = ControllerState.loading;
    final result = await dealsRepo.deleteDeals(dealID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getDeals(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }
}
