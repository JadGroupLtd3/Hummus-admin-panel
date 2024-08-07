import 'dart:typed_data';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  late CategoryRepo categoryRepo;

  CategoryController(this.categoryRepo);

  var controllerState = ControllerState.idle.obs;
  RxBool status = false.obs;
  XFile? pickedProfileImageFile;
  Uint8List webImage = Uint8List(8);
  File? pickedImage;
  RxInt categorySelectedId = 0.obs;
  String? imagePath;
  TextEditingController categoryNameAr = TextEditingController();
  TextEditingController categoryNameEn = TextEditingController();
  TextEditingController categoryNameHe = TextEditingController();
  TextEditingController categorySort = TextEditingController();

  RxList<Category> categoryList = <Category>[].obs;

  initState(){
    categoryNameAr.clear();
    categoryNameEn.clear();
    categoryNameHe.clear();
    categorySort.clear();
    pickedProfileImageFile = null;
    imagePath = null;
  }

  void isEdit(Category category){
    categoryNameAr.text = category.nameAr ?? '';
    categoryNameEn.text = category.nameEn ?? '';
    categoryNameHe.text = category.nameHe ?? '';
    categorySort.text = category.sort.toString();
    status.value = category.status == 1 ? true : false;
    imagePath = category.image ?? '';
  }

  Future<void> createCategory(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Category category = Category(
      nameAr: categoryNameAr.text,
      nameEn: categoryNameEn.text,
      nameHe: categoryNameHe.text,
      sort: int.parse(categorySort.text),
      status: status.value == true ? 1 : 0,
    );
    final result = await categoryRepo.createCategory(
      categoryModel: category,
      webImage: webImage,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getCategory(context);
      initState();
      update();
    });
  }

  Future<void> updateCategory(BuildContext context,int categoryId) async {
    controllerState.value = ControllerState.loading;
    Category category = Category(
      id: categoryId,
      nameAr: categoryNameAr.text,
      nameEn: categoryNameEn.text,
      nameHe: categoryNameHe.text,
      sort: int.parse(categorySort.text),
      status: status.value == true ? 1 : 0,
    );
    final result = await categoryRepo.updateCategory(
      categoryModel: category,
      webImage: webImage,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getCategory(context);
      initState();
      Get.back();
      update();
    });
  }

  Future<void> getCategory(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await categoryRepo.getCategory();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      categoryList.value = right.data;
    });
  }

  Future<void> deleteCategory(BuildContext context,{required int categoryID}) async {
    controllerState.value = ControllerState.loading;
    final result = await categoryRepo.deleteCategory(categoryID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getCategory(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }

}
