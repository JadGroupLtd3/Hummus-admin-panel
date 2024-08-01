import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home_element/model/popular_meals_model.dart';
import 'package:hummus_admin_panel/feature/home_element/repo/popular_meals_repo.dart';

class PopularMealsController extends GetxController {
  late PopularMealsRepo popularMealsRepo;

  PopularMealsController(this.popularMealsRepo);

  var controllerState = ControllerState.idle.obs;

  RxList<PopularMeals> popularMealsList = <PopularMeals>[].obs;
  RxList<PopularMeals> featureMealsList = <PopularMeals>[].obs;

  Future<void> getPopularMeals(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await popularMealsRepo.getPopularMeals();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      popularMealsList.value = right.data;
    });
  }

  Future<void> getFeatureMeals(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await popularMealsRepo.getFeatureMeals();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      featureMealsList.value = right.data;
    });
  }

  Future<void> deletePopularMeals(BuildContext context, {required int popularMealID}) async {
    controllerState.value = ControllerState.loading;
    final result = await popularMealsRepo.deletePopularMeals(popularMealID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getPopularMeals(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }

  Future<void> deleteFeatureMeals(BuildContext context, {required int featureMealID}) async {
    controllerState.value = ControllerState.loading;
    final result = await popularMealsRepo.deleteFeatureMeals(featureMealID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getFeatureMeals(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }

}