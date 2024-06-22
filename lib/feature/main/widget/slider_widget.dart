import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/main/controller/botton_nav_bar_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final BottomNavBarController bottomNavBarController = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 1,
            spreadRadius: 0,
            color: Colors.black.withOpacity(.08),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            15.verticalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                tabBTN(
                  imagePath: Images.home,
                  title: 'Home'.tr,
                  widget: Column(
                    children: [
                      subTabBTN(
                        title: 'Statistics'.tr,
                        page: 0,
                      ),
                      subTabBTN(
                        title: 'Settings'.tr,
                        page: 1,
                      ),
                      subTabBTN(
                        title: 'Delivery times'.tr,
                        page: 2,
                      ),
                      subTabBTN(
                        title: 'Notification settings'.tr,
                        page: 3,
                      ),
                      subTabBTN(
                        title: 'Show notifications'.tr,
                        page: 4,
                      ),
                    ],
                  ),
                ),
                tabBTN(
                  imagePath: Images.coupon,
                  title: 'Coupon'.tr,
                  widget: Column(
                    children: [
                      subTabBTN(
                        title: 'Show coupons'.tr,
                        page: 5,
                      ),
                      subTabBTN(
                        title: 'Add new'.tr,
                        page: 6,
                      ),
                    ],
                  ),
                ),
                tabBTN(
                  imagePath: Images.deal,
                  title: 'Deals'.tr,
                  widget: Column(
                    children: [
                      subTabBTN(
                        title: 'Show deals'.tr,
                        page: 7,
                      ),
                      subTabBTN(
                        title: 'Add new'.tr,
                        page: 8,
                      ),
                    ],
                  ),
                ),
                tabBTN(
                  imagePath: Images.home_work,
                  title: 'Work Area'.tr,
                  widget: Column(
                    children: [
                      subTabBTN(
                        title: 'Added domains'.tr,
                        page: 9,
                      ),
                      subTabBTN(
                        title: 'Add new'.tr,
                        page: 10,
                      ),
                    ],
                  ),
                ),
                tabBTN(
                  imagePath: Images.users,
                  title: 'Users'.tr,
                  widget: Column(
                    children: [
                      subTabBTN(
                        title: 'Managers'.tr,
                        page: 11,
                      ),
                      subTabBTN(
                        title: 'Waiters'.tr,
                        page: 12,
                      ),
                      subTabBTN(
                        title: 'Customers'.tr,
                        page: 13,
                      ),
                    ],
                  ),
                ),
                tabBTN(
                  imagePath: Images.Elements,
                  title: 'Elements'.tr,
                  widget: Column(
                    children: [
                      subTabBTN(
                        title: 'Most common'.tr,
                        page: 14,
                      ),
                      subTabBTN(
                        title: 'Displayed goods'.tr,
                        page: 15,
                      ),
                    ],
                  ),
                ),
                tabBTN(
                  imagePath: Images.questions,
                  title: 'Questions'.tr,
                  widget: Column(
                    children: [
                      subTabBTN(
                        title: 'Questions & Answers'.tr,
                        page: 16,
                      ),
                      subTabBTN(
                        title: 'Add new'.tr,
                        page: 17,
                      ),
                    ],
                  ),
                ),
                tabBTN(
                  imagePath: Images.hashtag,
                  title: 'Hashtag'.tr,
                  widget: Column(
                    children: [
                      subTabBTN(
                        title: 'Show hashtag'.tr,
                        page: 18,
                      ),
                      subTabBTN(
                        title: 'Add new'.tr,
                        page: 10,
                      ),
                    ],
                  ),
                ),
                tabBTN(
                  imagePath: Images.component,
                  title: 'Components'.tr,
                  widget: Column(
                    children: [
                      subTabBTN(
                        title: 'Show components'.tr,
                        page: 20,
                      ),
                      subTabBTN(
                        title: 'Add new'.tr,
                        page: 21,
                      ),
                    ],
                  ),
                ),
                tabBTN(
                  imagePath: Images.category,
                  title: 'Category'.tr,
                  widget: Column(
                    children: [
                      subTabBTN(
                        title: 'Show Category'.tr,
                        page: 22,
                      ),
                      subTabBTN(
                        title: 'Add new'.tr,
                        page: 23,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget tabBTN({final page, final imagePath, final title,final widget}) {
    return OnHover(
      matrix: 0,
      builder: (isHovered) {
        final hovered = Matrix4.identity()..translate(-5, 0, 0);
        final transform = isHovered ? hovered : Matrix4.identity();
        final color = isHovered
            ? MyThemeData.light.focusColor
            : MyThemeData.light.primaryColor;
        final textColor = isHovered
            ? MyThemeData.light.focusColor
            : const Color(0xffA8A8A8);
        return ExpandablePanel(
          collapsed: const SizedBox(),
          theme: const ExpandableThemeData(
            tapHeaderToExpand: true,
            hasIcon: true,
            iconSize: 16,
          ),
          header: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  imagePath,
                  color: bottomNavBarController.currentPage.value == page
                      ? MyThemeData.light.focusColor
                      : color,
                  height: 22,
                  width: 22,
                ),
                4.horizontalSpace,
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: transform,
                  child: Text(
                    title,
                    style: TajawalBold.copyWith(
                      fontSize: 14,
                      color: bottomNavBarController.currentPage.value == page
                          ? MyThemeData.light.focusColor
                          : textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          expanded: widget ?? const SizedBox(),
        ).paddingSymmetric(vertical: 4);
      },
    );
  }

  Widget subTabBTN({final page, final imagePath, final title}) {
    return OnHover(
      matrix: 0,
      onTap: () {
        setState(() {
          bottomNavBarController.goToTab(page);
        });
      },
      builder: (isHovered) {
        final hovered = Matrix4.identity()..translate(-5, 0, 0);
        final transform = isHovered ? hovered : Matrix4.identity();
        final color = isHovered
            ? MyThemeData.light.focusColor
            : MyThemeData.light.primaryColor;
        final textColor = isHovered
            ? MyThemeData.light.focusColor
            : const Color(0xffA8A8A8);
        return Row(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Row(
                children: [
                  5.horizontalSpace,
                  SvgPicture.asset(
                    Images.dot,
                    color: bottomNavBarController.currentPage.value == page
                        ? MyThemeData.light.focusColor
                        : color,
                    height: 8,
                    width: 8,
                  ),
                ],
              ),
            ),
            2.horizontalSpace,
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: transform,
              child: Text(
                title,
                style: TajawalBold.copyWith(
                  fontSize: 13,
                  color: bottomNavBarController.currentPage.value == page
                      ? MyThemeData.light.focusColor
                      : textColor,
                ),
              ).paddingOnly(top: 4),
            ),
          ],
        ).paddingSymmetric(vertical: 4);
      },
    );
  }
}
