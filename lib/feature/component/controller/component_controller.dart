import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/helper/snack_bar.dart';
import 'package:hummus_admin_panel/feature/component/model/component_model.dart';
import 'package:hummus_admin_panel/feature/component/repo/component_repo.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:image_picker/image_picker.dart';

class ComponentController extends GetxController {
  late ComponentRepo componentRepo;

  ComponentController(this.componentRepo);

  var controllerState = ControllerState.idle.obs;
  RxBool status = false.obs;
  XFile? pickedProfileImageFile;
  Uint8List webImage = Uint8List(8);
  File? pickedImage;

  TextEditingController componentNameAr = TextEditingController();
  TextEditingController componentNameEn = TextEditingController();
  TextEditingController componentNameHe = TextEditingController();

  ComponentModel? componentModel;
  RxList<Component> componentList = <Component>[].obs;

  Future<void> createComponent(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Component component = Component(
      nameAr: componentNameAr.text,
      nameEn: componentNameEn.text,
      nameHe: componentNameHe.text,
      status: status.value == true ? 1 : 0,
    );
    update();
    Response? response = await componentRepo.createComponent(
      componentModel: component,
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
      getComponent(context);
      componentNameAr.clear();
      componentNameEn.clear();
      componentNameHe.clear();
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

  Future<void> getComponent(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Response response = await componentRepo.getComponent();
    if (response.statusCode == 200) {
      controllerState.value = ControllerState.success;
      componentModel = ComponentModel.fromJson(response.body);
      componentList.value = componentModel!.data;
    } else {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: response.body['message'], color: Colors.red);
    }
    update();
  }
}
