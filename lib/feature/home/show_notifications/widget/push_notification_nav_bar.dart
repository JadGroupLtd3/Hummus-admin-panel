import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/language/controller/language_controller.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';

class PushNotificationNavBar extends StatefulWidget {
  final SliderPagesController sliderPagesController;

  const PushNotificationNavBar({super.key, required this.sliderPagesController});

  @override
  State<PushNotificationNavBar> createState() => _PushNotificationNavBarState();
}

class _PushNotificationNavBarState extends State<PushNotificationNavBar> {
  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.find<LanguageController>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            navBarItem(0),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.height * 1 / 5.5,
              color: widget.sliderPagesController.pushNotificationStatusName.value == 0
                  ? MyThemeData.light.primaryColor
                  : widget.sliderPagesController.pushNotificationStatusName.value == 1
                  ? MyThemeData.light.primaryColor
                  : Colors.grey.shade400,
            ),
            navBarItem(1),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.height * 1 / 5.5,
              color: widget.sliderPagesController.pushNotificationStatusName.value == 1 ||
                  widget.sliderPagesController.pushNotificationStatusName.value == 2
                  ? MyThemeData.light.primaryColor
                  : Colors.grey.shade400,
            ),
            navBarItem(2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Arabic'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 14,
                color: widget.sliderPagesController.pushNotificationStatusName.value == 0
                    ? MyThemeData.light.primaryColor
                    : Colors.black,
              ),
            ).paddingOnly(
              right: languageController.langLocal == eng ? 0 : 10,
              left: languageController.langLocal == eng ? 10 : 0,
              top: 10,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.height * 1 / 7.3,
              color: Colors.transparent,
            ),
            Text(
              'English'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 14,
                color: widget.sliderPagesController.pushNotificationStatusName.value == 1
                    ? MyThemeData.light.primaryColor
                    : Colors.black,
              ),
            ).paddingOnly(
              right: languageController.langLocal == eng ? 0 : 10,
              left: languageController.langLocal == eng ? 10 : 0,
              top: 10,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.height * 1 / 6.3,
              color: Colors.transparent,
            ),
            Text(
              'Hebrew'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 14,
                color: widget.sliderPagesController.pushNotificationStatusName.value == 2
                    ? MyThemeData.light.primaryColor
                    : Colors.black,
              ),
            ).paddingOnly(top: 10),
          ],
        ),
      ],
    );
  }

  Widget navBarItem(int page) {
    return OnHover(
      matrix: 0,
      onTap: () {
        setState(() {
          widget.sliderPagesController.goToPushNotificationNameTab(page);
        });
      },
      builder: (isHovered) {
        final color = isHovered ? MyThemeData.light.primaryColor : Colors.grey.shade400;
        return Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
            color: widget.sliderPagesController.pushNotificationStatusName.value == page
                ? MyThemeData.light.primaryColor
                : color,
          ),
          child: widget.sliderPagesController.pushNotificationStatusName.value == page
              ? const Icon(Icons.check, color: Colors.white, size: 15)
              : const SizedBox(),
        );
      },
    );
  }
}
