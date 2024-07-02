import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/helper/snack_bar.dart';
import 'package:hummus_admin_panel/feature/attributes/model/attribute_model.dart';
import 'package:hummus_admin_panel/feature/attributes/repo/attribute_repo.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';

class AttributeController extends GetxController {
  late AttributeRepo attributeRepo;

  AttributeController(this.attributeRepo);

  var controllerState = ControllerState.idle.obs;
  RxBool status = false.obs;

  TextEditingController attributeNameAr = TextEditingController();
  TextEditingController attributeNameEn = TextEditingController();
  TextEditingController attributeNameHe = TextEditingController();
  TextEditingController attributeSort = TextEditingController();

  RxList<Attribute> attributeList = <Attribute>[].obs;


  Future<void> createCategory(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Attribute attribute = Attribute(
      nameAr: attributeNameAr.text,
      nameEn: attributeNameEn.text,
      nameHe: attributeNameHe.text,
      status: status.value == true ? 1 : 0,
    );
    final result = await attributeRepo.createAttribute(
      attribute: attribute,
      status: status.value == true ? 1 : 0,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getAttribute(context);
      attributeNameAr.clear();
      attributeNameEn.clear();
      attributeNameHe.clear();
      update();
    });
  }

  Future<void> getAttribute(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await attributeRepo.getAttribute();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      attributeList.value = right.data;
    });
  }
}
