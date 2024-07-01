import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hummus_admin_panel/core/helper/snack_bar.dart';
import 'package:hummus_admin_panel/feature/category/model/category_model.dart';
import 'package:hummus_admin_panel/feature/category/repo/category_repo.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:image_picker/image_picker.dart';

class CategoryController extends GetxController {
  late CategoryRepo categoryRepo;

  CategoryController(this.categoryRepo);

  var controllerState = ControllerState.idle.obs;
  RxBool status = false.obs;
  XFile? pickedProfileImageFile;
  Uint8List webImage = Uint8List(8);
  File? pickedImage;

  TextEditingController categoryNameAr = TextEditingController();
  TextEditingController categoryNameEn = TextEditingController();
  TextEditingController categoryNameHe = TextEditingController();
  TextEditingController categorySort = TextEditingController();
  CategoryModel? categoryModel;
  RxList<Category> categoryList = <Category>[].obs;

  Future<void> createCategory(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Category category = Category(
      nameAr: categoryNameAr.text,
      nameEn: categoryNameEn.text,
      nameHe: categoryNameHe.text,
      sort: int.parse(categorySort.text),
      status: status.value == true ? 1 : 0,
    );
    print(category.toJson());
    update();
    Response? response = await categoryRepo.createCategory(
      categoryModel: category,
      webImage: webImage,
    );
    print(response?.statusCode);
    print(response?.body);
    if (response?.statusCode == 200) {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(
          context: context,
          message: response?.body['message'],
          color: Colors.green);
      getCategory(context);
      categoryNameAr.clear();
      categoryNameEn.clear();
      categoryNameHe.clear();
      categorySort.clear();
      pickedProfileImageFile = null;
    } else {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(
          context: context,
          message: response?.body['message'],
          color: Colors.red);
    }
    update();
  }

  Future<void> getCategory(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Response response = await categoryRepo.getCategory();
    if (response.statusCode == 200) {
      controllerState.value = ControllerState.success;
      categoryModel = CategoryModel.fromJson(response.body);
      categoryList.value = categoryModel!.data;
    } else {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: response.body['message'], color: Colors.red);
    }
    update();
  }
}
