import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/components/confirmation_dialog.dart';
import 'package:hummus_admin_panel/core/helper/route_helper.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/feature/auth/controller/sign_in_controller.dart';
import 'package:hummus_admin_panel/feature/language/view/change_language_view.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field2.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';

AppBar buildAppBar() {

  Widget appBarBTN({final imagePath, final onTap}) {
    return OnHover(
      onTap: onTap,
      builder: (isHovered) {
        final color = isHovered ? MyThemeData.light.primaryColor : Colors.white;
        return SvgPicture.asset(
          imagePath,
          color: color,
        );
      },
    );
  }

  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0,
    leadingWidth: 235,
    leading: Row(
      children: [
        Image.asset(Images.logo, width: 160, height: 50)
            .paddingSymmetric(horizontal: 20),
      ],
    ),
    actions: [
      CustomTextField2(
        isTitle: false,
        height: 35,
        width: 250,
        hintText: 'search'.tr,
        prefixIcon: const Icon(Icons.search, size: 20),
      ).paddingOnly(top: 10),
      6.horizontalSpace,
      appBarBTN(
        onTap: () {
          Get.dialog(
            ChangeLanguageDialog(),
            useSafeArea: false,
          );
        },
        imagePath: Images.language,
      ),
      6.horizontalSpace,
      appBarBTN(
        onTap: () {
          Get.dialog(
              ConfirmationDialog(
                icon: Images.logOutDialog,
                description: 'Do you really want to exit the app?'.tr,
                isLogOut: true,
                onYesPressed: () {
                  Get.find<SignInController>().clearSharedData();
                  Get.back();
                  Get.offAllNamed(RouteHelper.signInScreen);
                },
              ),
              useSafeArea: false);
        },
        imagePath: Images.settings,
      ),
      6.horizontalSpace,
      appBarBTN(imagePath: Images.notifications),
      6.horizontalSpace,
    ],
  );
}
