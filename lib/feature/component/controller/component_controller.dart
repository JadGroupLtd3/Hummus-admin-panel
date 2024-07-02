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

  RxList<Component> componentList = <Component>[].obs;

  Future<void> createComponent(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Component component = Component(
      nameAr: componentNameAr.text,
      nameEn: componentNameEn.text,
      nameHe: componentNameHe.text,
      status: status.value == true ? 1 : 0,
    );
    final result = await componentRepo.createComponent(
      componentModel: component,
      webImage: webImage,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getComponent(context);
      componentNameAr.clear();
      componentNameEn.clear();
      componentNameHe.clear();
      pickedProfileImageFile = null;
      update();
    });
  }

  Future<void> getComponent(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await componentRepo.getComponent();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      componentList.value = right.data;
    });
  }
}
