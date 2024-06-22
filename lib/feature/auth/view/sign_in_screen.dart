import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/helper/route_helper.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_button.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field2.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.background,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 100,
            right: 100,
            child: Container(
              padding: const EdgeInsets.all(80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image.asset(Images.logo),
                  25.verticalSpace,
                  CustomTextField2(
                    title: '',
                    height: 60,
                    width: MediaQuery.of(context).size.width * 1 / 3.5,
                    isBorder: false,
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    filled: false,
                    hintText: 'User Name'.tr,
                  ),
                  25.verticalSpace,
                  CustomTextField2(
                    title: '',
                    height: 60,
                    width: MediaQuery.of(context).size.width * 1 / 3.5,
                    isBorder: false,
                    isPassword: true,
                    prefixIcon: const Icon(Icons.visibility_off),
                    filled: false,
                    hintText: 'password'.tr,
                  ),
                  25.verticalSpace,
                  CustomButton(
                    buttonText: 'Sign In'.tr,
                    height: 50,
                    radius: 40,
                    backGroundColor: MyThemeData.light.focusColor,
                    width: MediaQuery.of(context).size.width * 1 / 3.8,
                    onPressed: (){
                      Get.toNamed(RouteHelper.mainScreen);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
