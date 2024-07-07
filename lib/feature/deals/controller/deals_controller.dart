import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class DealsController extends GetxController {
  late DealsRepo dealsRepo;

  DealsController(this.dealsRepo);

  var controllerState = ControllerState.idle.obs;
  RxList<Deals> dealsList = <Deals>[].obs;
  RxList<DealMealsModel> selectedMealsList = <DealMealsModel>[].obs;
  XFile? pickedProfileImageFile;
  Uint8List webImage = Uint8List(8);
  File? pickedImage;
  RxBool status = false.obs;

  TextEditingController startDateDeal = TextEditingController();
  TextEditingController endDateDeal = TextEditingController();
  TextEditingController userUseCountDeal = TextEditingController();
  TextEditingController totalPriceDeal = TextEditingController();
  TextEditingController dealArabicName = TextEditingController();
  TextEditingController dealArabicDescription = TextEditingController();
  TextEditingController dealEnglishName = TextEditingController();
  TextEditingController dealEnglishDescription = TextEditingController();
  TextEditingController dealHebrewName = TextEditingController();
  TextEditingController dealHebrewDescription = TextEditingController();

  initState() {
    pickedProfileImageFile = null;
    startDateDeal.clear();
    endDateDeal.clear();
    userUseCountDeal.clear();
    totalPriceDeal.clear();
    dealArabicName.clear();
    dealArabicDescription.clear();
    dealEnglishName.clear();
    dealEnglishDescription.clear();
    dealHebrewName.clear();
    dealHebrewDescription.clear();
    selectedMealsList.clear();
  }

  Future<void> createDeals(BuildContext context) async {
    if (pickedProfileImageFile == null) {
      ShowSnackBar.show(context: context, message: "Please select an image", color: Colors.red);
      return;
    }
    controllerState.value = ControllerState.loading;
    CreateDealModel dealModel = CreateDealModel(
      startDate: startDateDeal.text,
      endDate: endDateDeal.text,
      userUseCount: userUseCountDeal.text,
      totalPrice: totalPriceDeal.text,
      ar: TextType(
        name: dealArabicName.text,
        description: dealArabicDescription.text,
        image: pickedProfileImageFile?.path ?? "",
      ),
      en: TextType(
        name: dealEnglishName.text,
        description: dealEnglishDescription.text,
        image: pickedProfileImageFile?.path ?? "",
      ),
      he: TextType(
        name: dealHebrewName.text,
        description: dealHebrewDescription.text,
        image: pickedProfileImageFile?.path ?? "",
      ),
      meals: selectedMealsList,
      status: status.value == true ? 1 : 0,
    );
    final result = await dealsRepo.createDeals(dealModel, webImage);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      startDateDeal.clear();
      endDateDeal.clear();
      userUseCountDeal.clear();
      totalPriceDeal.clear();
      dealArabicName.clear();
      dealArabicDescription.clear();
      dealEnglishName.clear();
      dealEnglishDescription.clear();
      dealHebrewName.clear();
      dealHebrewDescription.clear();
      selectedMealsList.clear();
      getDeals(context);
      update();
    });
  }


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

  Future<void> deleteDeals(BuildContext context, {required int dealID}) async {
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
      ShowSnackBar.show(
          context: context, message: right.message, color: Colors.green);
    });
  }
}
