import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
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

  AttributeModel? attributeModel;
  RxList<Attribute> attributeList = <Attribute>[].obs;

  Future<void> createCategory(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Attribute attribute = Attribute(
      nameAr: attributeNameAr.text,
      nameEn: attributeNameEn.text,
      nameHe: attributeNameHe.text,
      status: status.value == true ? 1 : 0,
    );
    update();
    Response? response = await attributeRepo.createAttribute(
        attribute: attribute,
        status: status.value == true ? 1 : 0,
    );
    print(response?.statusCode);
    print(response?.body);
    if (response?.statusCode == 200) {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(
          context: context,
          message: response?.body['message'],
          color: Colors.green);
      getAttribute(context);
      attributeNameAr.clear();
      attributeNameEn.clear();
      attributeNameHe.clear();
    } else {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(
          context: context,
          message: response?.body['message'],
          color: Colors.red);
    }
    update();
  }

  Future<void> getAttribute(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Response response = await attributeRepo.getAttribute();
    if (response.statusCode == 200) {
      controllerState.value = ControllerState.success;
      attributeModel = AttributeModel.fromJson(response.body);
      attributeList.value = attributeModel!.data;
    } else {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: response.body['message'], color: Colors.red);
    }
    update();
  }
}
