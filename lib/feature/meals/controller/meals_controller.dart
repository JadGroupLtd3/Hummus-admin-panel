import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/meals/model/meals_model.dart';

class MealsController extends GetxController {
  late MealsRepo mealsRepo;

  MealsController(this.mealsRepo);

  var controllerState = ControllerState.idle.obs;
  RxList<Meals> mealsList = <Meals>[].obs;
  RxList<Meals> recommendedMealList = <Meals>[].obs;
  RxList<CreateComponents> selectedComponentsList = <CreateComponents>[].obs;
  RxList<CreateHashtags> selectedHashtagsList = <CreateHashtags>[].obs;
  Map<String,List<CreateAttributes>> selectedMapAttributesList = {};
  RxList<CreateAttributes> selectedAttributesList = <CreateAttributes>[].obs;
  RxList<CreateMealImages> selectedImagesList = <CreateMealImages>[].obs;
  RxList<CreateHomeCategories> selectedHomeCategoriesList = <CreateHomeCategories>[].obs;
  RxList<CreateRelatedProducts> selectedRelatedProductsList = <CreateRelatedProducts>[].obs;
  XFile? pickedProfileImageFile;
  Uint8List webImage = Uint8List(8);
  File? pickedImage;
  RxBool status = false.obs;
  String? imagePath;
  TextEditingController fakePrice = TextEditingController();
  TextEditingController mealPrice = TextEditingController();
  TextEditingController coinPoints = TextEditingController(text: '0');
  TextEditingController mealArabicName = TextEditingController();
  TextEditingController mealArabicDescription = TextEditingController();
  TextEditingController mealEnglishName = TextEditingController();
  TextEditingController mealEnglishDescription = TextEditingController();
  TextEditingController mealHebrewName = TextEditingController();
  TextEditingController mealHebrewDescription = TextEditingController();

  Uint8List? webImage1;
  Uint8List? webImage2;
  Uint8List? webImage3;
  XFile? pickedFile1;
  XFile? pickedFile2;
  XFile? pickedFile3;

  var nameArControllers = <List<TextEditingController>>[].obs;
  var nameEnControllers = <List<TextEditingController>>[].obs;
  var nameHeControllers = <List<TextEditingController>>[].obs;
  var priceControllers = <List<TextEditingController>>[].obs;
  var isCheckStates = <List<int>>[].obs;

  void initializeControllers() {
    nameArControllers.add([TextEditingController()]);
    nameEnControllers.add([TextEditingController()]);
    nameHeControllers.add([TextEditingController()]);
    priceControllers.add([TextEditingController()]);
    isCheckStates.add([0]);
  }

  void addNewItemControllers(int attributeIndex) {
    nameArControllers[attributeIndex].add(TextEditingController());
    nameEnControllers[attributeIndex].add(TextEditingController());
    nameHeControllers[attributeIndex].add(TextEditingController());
    priceControllers[attributeIndex].add(TextEditingController());
    isCheckStates[attributeIndex].add(0);
  }

  void removeItemControllers(int attributeIndex, int index) {
    if (attributeIndex < nameArControllers.length &&
        attributeIndex < nameEnControllers.length &&
        attributeIndex < nameHeControllers.length &&
        attributeIndex < isCheckStates.length &&
        attributeIndex < priceControllers.length &&
        index < nameArControllers[attributeIndex].length &&
        index < nameEnControllers[attributeIndex].length &&
        index < nameHeControllers[attributeIndex].length &&
        index < isCheckStates[attributeIndex].length &&
        index < priceControllers[attributeIndex].length) {
      nameArControllers[attributeIndex].removeAt(index);
      nameEnControllers[attributeIndex].removeAt(index);
      nameHeControllers[attributeIndex].removeAt(index);
      isCheckStates[attributeIndex].removeAt(index);
      priceControllers[attributeIndex].removeAt(index);
    }
  }

  void initializeControllersForAttribute(int attributeId) {
    final attributeIndex = selectedAttributesList
        .indexWhere((element) => element.attributeId == attributeId);

    if (attributeIndex != -1 && nameArControllers.length <= attributeIndex) {
      nameArControllers.add([]);
      nameEnControllers.add([]);
      nameHeControllers.add([]);
      isCheckStates.add([]);
      priceControllers.add([]);
      addNewItemControllers(attributeIndex);
    }
  }

  @override
  void onInit() {
    initializeControllers();
    super.onInit();
  }

  void selectAttribute(int attributeId) {
    if (!selectedMapAttributesList.containsKey(attributeId.toString())) {
      selectedMapAttributesList[attributeId.toString()] = <CreateAttributes>[];
    }
  }

  void addCreateAttribute(int attributeId, CreateAttributes newAttribute) {
    if (selectedMapAttributesList.containsKey(attributeId.toString())) {
      selectedMapAttributesList[attributeId.toString()]!.add(newAttribute);
    } else {
      selectedMapAttributesList[attributeId.toString()] = [newAttribute];
    }
  }

  void removeCreateAttribute(int attributeId, int index) {
    final attributeList = selectedMapAttributesList[attributeId.toString()];
    if (attributeList != null && attributeList.length > index) {
      attributeList.removeAt(index);
      if (attributeList.isEmpty) {
        selectedMapAttributesList.remove(attributeId.toString());
      }
    }
  }

  var selectedMeal = Rxn<Meals>();

  void selectMeal(Meals? meal) {
    selectedMeal.value = meal;
    if (meal != null) {
      print('Selected meal: ${meal.name}');
    } else {
      print('Meal selection cleared');
    }
  }

  void clearSelectedMeal() {
    selectedMeal.value = null;
    print('Meal selection cleared');
  }

  initState() {
    selectedHashtagsList.clear();
    selectedComponentsList.clear();
    selectedAttributesList.clear();
    selectedMapAttributesList.clear();
    selectedImagesList.clear();
    selectedHomeCategoriesList.clear();
    fakePrice.clear();
    mealPrice.clear();
    coinPoints.clear();
    mealArabicName.clear();
    mealArabicDescription.clear();
    mealEnglishName.clear();
    mealEnglishDescription.clear();
    mealHebrewName.clear();
    mealHebrewDescription.clear();
    pickedProfileImageFile = null;
    imagePath = null;
    webImage1 = null;
    webImage2 = null;
    webImage3 = null;
    pickedFile1 = null;
    pickedFile2 = null;
    pickedFile3 = null;
    Get.find<CategoryController>().categorySelectedId.value = 0;
  }

  void isEdit(Meals meal) {
    fakePrice.text = meal.fakePrice;
    mealPrice.text = meal.totalPrice;
    coinPoints.text = meal.coinPoints.toString();
    mealArabicName.text = meal.name.ar;
    mealArabicDescription.text = meal.description.ar;
    mealEnglishName.text = meal.name.en;
    mealEnglishDescription.text = meal.description.en;
    mealHebrewName.text = meal.name.he;
    mealHebrewDescription.text = meal.description.he;
    imagePath = meal.primaryImage;
    Get.find<CategoryController>().categorySelectedId.value = meal.category.id;
    for (var homeCategory in meal.homeCategoriesMeals) {
      selectedHomeCategoriesList.add(CreateHomeCategories(type: homeCategory));
    }
    for (var hashtag in meal.hashtags) {
      selectedHashtagsList.add(CreateHashtags(hashtagId: hashtag.id));
    }
    for (var component in meal.components) {
      selectedComponentsList.add(
        CreateComponents(
          componentId: component.id,
          status: 1,
          isDefault: component.isDefault,
          price: 0,
        ),
      );
    }
    print(selectedComponentsList);
    // for(var attribute in meal.attributes){
    //   selectedAttributesList.add(
    //       CreateAttributes(
    //         attributeId: attribute.items.firstWhere((element) => element. == attribute.),
    //         image: '',
    //         nameAr: attribute.items.firstWhere((element) => element.id ==),
    //         nameEn: attribute.nameEn ?? "",
    //         nameHe: attribute.nameHe ?? "",
    //         isCheck: 0,
    //         price: attribute.items.firstWhere((element) => element.),
    //       ),
    //   );
    // }
  }

  RxList<CreateAttributes> generateSelectedAttributesList(Map<String, List<CreateAttributes>> selectedMapAttributesList) {
    RxList<CreateAttributes> selectedAttributesList = <CreateAttributes>[].obs;
    selectedMapAttributesList.forEach((attributeId, attributeList) {
      for (var attribute in attributeList) {
        selectedAttributesList.add(CreateAttributes(
          attributeId: int.tryParse(attributeId) ?? 0,
          image: attribute.image ?? '',
          nameAr: attribute.nameAr ?? '',
          nameEn: attribute.nameEn ?? '',
          nameHe: attribute.nameHe ?? '',
          isCheck: attribute.isCheck ?? 0,
          price: attribute.price ?? 0,
        ));
      }
    });

    return selectedAttributesList;
  }


  Future<void> createMeals(BuildContext context) async {
    if (pickedProfileImageFile == null) {
      ShowSnackBar.show(
          context: context,
          message: "Please select an image",
          color: Colors.red);
      return;
    }
    final selectedAttributesList = generateSelectedAttributesList(selectedMapAttributesList);
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
      images: selectedImagesList,
      hashtags: selectedHashtagsList,
      components: selectedComponentsList,
      attributes: selectedAttributesList,
      homeCategories: selectedHomeCategoriesList,
      relatedProducts: selectedRelatedProductsList,
      coinPoints: coinPoints.text.isEmpty ? 0 : coinPoints.text,
    );
    print(jsonEncode(mealModel.toJson()));
    final result = await mealsRepo.createMeals(mealModel, webImage);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      getMeals(context);
      ShowSnackBar.show(
          context: context, message: right.message, color: Colors.green);
      initState();
      update();
    });
  }

  Future<void> updateMeals(BuildContext context, int mealId) async {
    if (pickedProfileImageFile == null) {
      ShowSnackBar.show(
          context: context,
          message: "Please select an image",
          color: Colors.red);
      return;
    }
    controllerState.value = ControllerState.loading;
    CreateMealModel mealModel = CreateMealModel(
      id: mealId,
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
      coinPoints: 0, // coinPoints.text,
    );
    print(mealModel.toJson());
    final result = await mealsRepo.updateMeals(mealModel, webImage);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      getMeals(context);
      ShowSnackBar.show(
          context: context, message: right.message, color: Colors.green);
      initState();
      Get.back();
      update();
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

  Future<void> createRecommendedMeals(BuildContext context, int mealId) async {
    controllerState.value = ControllerState.loading;
    final result = await mealsRepo.createRecommendedMeals(mealId);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      getRecommendedMeals(context);
      // ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      update();
    });
  }

  Future<void> getRecommendedMeals(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await mealsRepo.getRecommendedMeals();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      recommendedMealList.value = right.data;
    });
  }

  Future<void> deleteRecommendedMeals(BuildContext context,
      {required int mealID}) async {
    controllerState.value = ControllerState.loading;
    final result = await mealsRepo.deleteRecommendedMeals(mealID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getRecommendedMeals(context);
      update();
      ShowSnackBar.show(
          context: context, message: right.message, color: Colors.green);
    });
  }
}
