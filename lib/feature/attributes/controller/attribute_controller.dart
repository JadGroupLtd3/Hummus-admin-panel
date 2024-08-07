import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';


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

  initState(){
    attributeNameAr.clear();
    attributeNameEn.clear();
    attributeNameHe.clear();
    status.value = false;
  }

  void isEdit(Attribute attribute){
    attributeNameAr.text = attribute.nameAr ?? '';
    attributeNameEn.text = attribute.nameEn ?? '';
    attributeNameHe.text = attribute.nameHe ?? '';
    status.value = attribute.status == 1 ? true : false;
  }


  Future<void> createAttribute(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Attribute attribute = Attribute(
      nameAr: attributeNameAr.text,
      nameEn: attributeNameEn.text,
      nameHe: attributeNameHe.text,
      status: status.value == true ? 1 : 0,
    );
    final result = await attributeRepo.createAttribute(
      attribute: attribute
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getAttribute(context);
      initState();
      update();
    });
  }

  Future<void> updateAttribute(BuildContext context,int attributeId) async {
    controllerState.value = ControllerState.loading;
    Attribute attribute = Attribute(
      id: attributeId,
      nameAr: attributeNameAr.text,
      nameEn: attributeNameEn.text,
      nameHe: attributeNameHe.text,
      status: status.value == true ? 1 : 0,
    );
    final result = await attributeRepo.updateAttribute(
      attribute: attribute
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
      getAttribute(context);
      initState();
      Get.back();
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

  Future<void> deleteAttribute(BuildContext context,{required int attributeID}) async {
    controllerState.value = ControllerState.loading;
    final result = await attributeRepo.deleteAttribute(attributeID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getAttribute(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }
}
