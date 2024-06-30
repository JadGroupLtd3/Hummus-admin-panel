import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/helper/preferences_helper.dart';
import 'package:hummus_admin_panel/core/helper/route_helper.dart';
import 'package:hummus_admin_panel/core/helper/snack_bar.dart';
import 'package:hummus_admin_panel/feature/auth/model/sign_in_model.dart';
import 'package:hummus_admin_panel/feature/auth/repo/sign_in_repo.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';

class SignInController extends GetxController {
  late SignInRepo signInRepo;

  SignInController(this.signInRepo);

  var controllerState = ControllerState.idle.obs;

  late UserSignIn signInModel;
  var rememberUser = true.obs;

  TextEditingController signInPhoneController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  Future<void> login(BuildContext context,String lang) async {
    controllerState.value = ControllerState.loading;
    update();
    Response? response = await signInRepo.login(
      phone: signInPhoneController.text,
      password: signInPasswordController.text,
      lang: lang,
    );
    print(response?.statusCode);
    print(response?.body);
    if (response!.statusCode == 200) {
      controllerState.value = ControllerState.success;
      PrefsHelper.setData(key: 'token', value: response.body['data']['token']);
      print(PrefsHelper.getToken());
      PrefsHelper.setData(key: 'userId', value: response.body['data']['user']['id']);
      print(PrefsHelper.getUserId());
      PrefsHelper.setData(key: 'phoneNumber', value: response.body['data']['user']['phone']);
      Get.offAllNamed(RouteHelper.mainScreen);
      Get.find<SliderPagesController>().goToTab(0);
    } else {
      ShowSnackBar.show(context: context, message: response.body['message'], color: Colors.red);
    }
    update();
  }
}
