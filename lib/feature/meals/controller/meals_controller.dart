import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/meals/model/meals_model.dart';


class MealsController extends GetxController {
  late MealsRepo mealsRepo;

  MealsController(this.mealsRepo);

  var controllerState = ControllerState.idle.obs;
  RxList<Meals> mealsList = <Meals>[].obs;

  Future<void> getMeals(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await mealsRepo.getMeals();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      mealsList.value = right.data;
    });
  }

  Future<void> deleteMeals(BuildContext context,{required int mealID}) async {
    controllerState.value = ControllerState.loading;
    final result = await mealsRepo.deleteMeals(mealID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getMeals(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }
}
