import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/users/model/admin_model.dart';


class UsersController extends GetxController {
  late UsersRepo usersRepo;

  UsersController(this.usersRepo);

  var controllerState = ControllerState.idle.obs;

  RxList<Waiters> waitersList = <Waiters>[].obs;
  RxList<Admin> adminList = <Admin>[].obs;

  Future<void> getWaiters(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await usersRepo.getWaiters();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      waitersList.value = right.data;
    });
  }

  Future<void> getAdmins(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await usersRepo.getAdmins();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      adminList.value = right.data;
    });
  }


}
