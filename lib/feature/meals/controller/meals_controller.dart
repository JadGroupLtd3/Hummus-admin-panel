import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/meals/model/create_meal_model.dart';
import 'package:hummus_admin_panel/feature/meals/model/meals_model.dart';

class MealsController extends GetxController {
  late MealsRepo mealsRepo;

  MealsController(this.mealsRepo);

  var controllerState = ControllerState.idle.obs;
  RxList<Meals> mealsList = <Meals>[].obs;
  RxList<CreateComponents> selectedComponentsList = <CreateComponents>[].obs;
  RxList<CreateHashtags> selectedHashtagsList = <CreateHashtags>[].obs;
  RxList<CreateAttributes> selectedAttributesList = <CreateAttributes>[].obs;
  RxList<CreateHomeCategories> selectedHomeCategoriesList =
      <CreateHomeCategories>[].obs;
  XFile? pickedProfileImageFile;
  Uint8List webImage = Uint8List(8);
  File? pickedImage;
  RxBool status = false.obs;

  TextEditingController fakePrice = TextEditingController();
  TextEditingController mealPrice = TextEditingController();
  TextEditingController coinPoints = TextEditingController();
  TextEditingController mealArabicName = TextEditingController();
  TextEditingController mealArabicDescription = TextEditingController();
  TextEditingController mealEnglishName = TextEditingController();
  TextEditingController mealEnglishDescription = TextEditingController();
  TextEditingController mealHebrewName = TextEditingController();
  TextEditingController mealHebrewDescription = TextEditingController();

  Future<void> createMeals(BuildContext context) async {
    if (pickedProfileImageFile == null) {
      ShowSnackBar.show(
          context: context,
          message: "Please select an image",
          color: Colors.red);
      return;
    }
    controllerState.value = ControllerState.loading;
    CreateMealModel mealModel = CreateMealModel(
      categoryId: Get.find<CategoryController>().categorySelectedId.value,
      fakePrice: fakePrice.text,
      price: mealPrice.text,
      image: pickedProfileImageFile?.path ?? "",
      texts: [
        CreateTexts(
          name: mealArabicName.text,
          description: mealArabicDescription.text,
          lang: 'ar',
        ),
        CreateTexts(
          name: mealEnglishName.text,
          description: mealEnglishDescription.text,
          lang: 'en',
        ),
        CreateTexts(
          name: mealHebrewName.text,
          description: mealHebrewDescription.text,
          lang: 'he',
        ),
      ],
      images: [],
      hashtags: selectedHashtagsList,
      components: selectedComponentsList,
      attributes: selectedAttributesList,
      homeCategories: selectedHomeCategoriesList,
      relatedProducts: [],
      coinPoints: coinPoints.text,
    );
    final result = await mealsRepo.createMeals(mealModel, webImage);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      getMeals(context);
    });
  }

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

  Future<void> deleteMeals(BuildContext context, {required int mealID}) async {
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
      ShowSnackBar.show(
          context: context, message: right.message, color: Colors.green);
    });
  }
}
