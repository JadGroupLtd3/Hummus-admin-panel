import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/users/model/admin_model.dart';


class UsersController extends GetxController {
  late UsersRepo usersRepo;

  UsersController(this.usersRepo);

  var controllerState = ControllerState.idle.obs;

  RxList<Waiters> waitersList = <Waiters>[].obs;
  RxList<Admin> adminList = <Admin>[].obs;

  XFile? pickedProfileImageFile;
  Uint8List webImage = Uint8List(8);
  File? pickedImage;
  String? imagePath;
  TextEditingController adminNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController waiterNameController = TextEditingController();
  TextEditingController waiterPhoneController = TextEditingController();
  TextEditingController waiterEmailController = TextEditingController();
  TextEditingController waiterPasswordController = TextEditingController();


  initState(){
    adminNameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    pickedProfileImageFile = null;
  }
  initStateWaiter(){
    waiterNameController.clear();
    waiterPhoneController.clear();
    waiterEmailController.clear();
    waiterPasswordController.clear();
    pickedProfileImageFile = null;
  }

  void isEdit(Admin admin){
    adminNameController.text = admin.firstName ?? '';
    phoneController.text = admin.phone ?? '';
    emailController.text = admin.email ?? '';
    imagePath = admin.image ?? '';
  }
  void isEditWaiter(Waiters waiters){
    waiterNameController.text = waiters.firstName ?? '';
    waiterPhoneController.text = waiters.phone ?? '';
    waiterEmailController.text = waiters.email ?? '';
    imagePath = waiters.image ?? '';
  }

  Future<void> createAdmins(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Admin admin = Admin(
      firstName: adminNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      lastName: "last_name",
      password: passwordController.text,
    );
    final result = await usersRepo.createAdmins(
      adminModel: admin,
      webImage: webImage,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: "Send successfully".tr, color: Colors.green);
      getAdmins(context);
      initState();
      update();
    });
  }

  Future<void> updateAdmins(BuildContext context,int adminId) async {
    controllerState.value = ControllerState.loading;
    Admin admin = Admin(
      id: adminId,
      firstName: adminNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      lastName: "last_name",
      password: passwordController.text,
    );
    final result = await usersRepo.updateAdmins(
      adminModel: admin,
      webImage: webImage,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: "Send successfully".tr, color: Colors.green);
      getAdmins(context);
      initState();
      Get.back();
      update();
    });
  }

  Future<void> deleteAdmins(BuildContext context,{required int adminID}) async {
    controllerState.value = ControllerState.loading;
    final result = await usersRepo.deleteAdmins(adminID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getAdmins(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }

  Future<void> getAdmins(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await usersRepo.getAdmins();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      adminList.value = right.data;
    });
  }



  Future<void> getWaiters(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    final result = await usersRepo.getWaiters();
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) {
      controllerState.value = ControllerState.success;
      waitersList.value = right.data;
    });
  }

  Future<void> createWaiters(BuildContext context) async {
    controllerState.value = ControllerState.loading;
    Waiters waiters = Waiters(
      firstName: waiterNameController.text,
      email: waiterPhoneController.text,
      phone: waiterEmailController.text,
      lastName: "last_name",
      password: waiterPasswordController.text,
    );
    final result = await usersRepo.createWaiters(
      adminModel: waiters,
      webImage: webImage,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: "Send successfully".tr, color: Colors.green);
      getWaiters(context);
      initStateWaiter();
      update();
    });
  }

  Future<void> updateWaiters(BuildContext context,int adminId) async {
    controllerState.value = ControllerState.loading;
    Waiters waiters = Waiters(
      id: adminId,
      firstName: waiterNameController.text,
      email: waiterPhoneController.text,
      phone: waiterEmailController.text,
      lastName: "last_name",
      password: waiterPasswordController.text,
    );
    final result = await usersRepo.updateWaiters(
      waiterModel: waiters,
      webImage: webImage,
    );
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
    }, (right) async {
      controllerState.value = ControllerState.success;
      ShowSnackBar.show(context: context, message: "Send successfully".tr, color: Colors.green);
      getWaiters(context);
      initStateWaiter();
      Get.back();
      update();
    });
  }

  Future<void> deleteWaiters(BuildContext context,{required int waiterID}) async {
    controllerState.value = ControllerState.loading;
    final result = await usersRepo.deleteWaiters(waiterID);
    result.fold((left) {
      controllerState.value = ControllerState.error;
      ShowSnackBar.show(context: context, message: left, color: Colors.red);
      update();
    }, (right) async {
      controllerState.value = ControllerState.success;
      await getWaiters(context);
      update();
      Navigator.pop(context);
      ShowSnackBar.show(context: context, message: right.message, color: Colors.green);
    });
  }


}
