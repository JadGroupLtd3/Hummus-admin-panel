import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/language/controller/language_controller.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';

class OrdersStatusNavBar extends StatelessWidget {
  final SliderPagesController sliderPagesController;

  const OrdersStatusNavBar({super.key, required this.sliderPagesController});

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController =
        Get.find<LanguageController>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            questionNavBarItem(0),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.height * 1 / 5.5,
              color: sliderPagesController.currentOrderStatusName.value == 0
                  ? MyThemeData.light.primaryColor
                  : sliderPagesController.currentOrderStatusName.value == 1
                      ? MyThemeData.light.primaryColor
                      : const Color(0xffE4E4E4),
            ),
            questionNavBarItem(1),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.height * 1 / 5.5,
              color: sliderPagesController.currentOrderStatusName.value == 1 ||
                      sliderPagesController.currentOrderStatusName.value == 2
                  ? MyThemeData.light.primaryColor
                  : const Color(0xffE4E4E4),
            ),
            questionNavBarItem(2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Waiting'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 14,
                color: sliderPagesController.currentOrderStatusName.value == 0
                    ? MyThemeData.light.primaryColor
                    : Colors.black,
              ),
            ).paddingOnly(
              right: languageController.langLocal == eng ? 0 : 10,
              left: languageController.langLocal == eng ? 10 : 0,
              top: 10,
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.height * 1 / 7.3,
              color: Colors.transparent,
            ),
            Text(
              'Processing'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 14,
                color: sliderPagesController.currentOrderStatusName.value == 1
                    ? MyThemeData.light.primaryColor
                    : Colors.black,
              ),
            ).paddingOnly(
              right: languageController.langLocal == eng ? 0 : 10,
              left: languageController.langLocal == eng ? 10 : 0,
              top: 10,
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.height * 1 / 6.3,
              color: Colors.transparent,
            ),
            Text(
              'Complete'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 14,
                color: sliderPagesController.currentOrderStatusName.value == 2
                    ? MyThemeData.light.primaryColor
                    : Colors.black,
              ),
            ).paddingOnly(top: 10),
          ],
        ),
      ],
    );
  }

  Widget questionNavBarItem(int page) {
    return OnHover(
      matrix: 0,
      onTap: () {
        sliderPagesController.goToOrderStatusNameTab(page);
      },
      builder: (isHovered) {
        final color = isHovered ? MyThemeData.light.primaryColor : const Color(0xffE4E4E4);
        return Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
            color: sliderPagesController.currentOrderStatusName.value == page
                ? MyThemeData.light.primaryColor
                : color,
          ),
          child: sliderPagesController.currentOrderStatusName.value == page
              ? const Icon(Icons.check, color: Colors.white, size: 15)
              : const SizedBox(),
        );
      },
    );
  }
}
