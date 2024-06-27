import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/helper/responsive_helper.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/feature/language/controller/language_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';
import 'package:hummus_admin_panel/widgets/text_utils.dart';

class ExpandedOrderDetails extends StatefulWidget {
  const ExpandedOrderDetails({super.key});

  @override
  State<ExpandedOrderDetails> createState() => _ExpandedOrderDetailsState();
}

class _ExpandedOrderDetailsState extends State<ExpandedOrderDetails> {

  late ExpandableController? controller;
  final LanguageController languageController = Get.find<LanguageController>();
  @override
  void initState() {
    super.initState();
    controller = ExpandableController();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        hasIcon: false,
        tapHeaderToExpand: false,
      ),
      collapsed: const SizedBox(),
      controller: controller,
      header: Table(
        children: [
          TableRow(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black.withOpacity(0.1)),
                bottom: BorderSide(color: Colors.black.withOpacity(0.1)),
              ),
            ),
            children: [
              const TextUtils(title:'#').paddingOnly(
                  right: languageController.langLocal == eng ? 0 : 20,
                  left: languageController.langLocal == eng ? 20 : 0,top: 10,bottom: 10),
              TextUtils(title: 'Customer Name'.tr).paddingOnly(
                  left: languageController.langLocal == eng ? 0 : 30,
                  right: languageController.langLocal == eng ? 30 : 0,top: 10,bottom: 10),
              const TextUtils(title: '4').paddingOnly(
                  left: languageController.langLocal == eng ? 40 : 0,
                  right: languageController.langLocal == eng ? 0 : 40
                  ,top: 10,bottom: 10),
              const TextUtils(title: '\$30').paddingOnly(
                  right: languageController.langLocal == eng ? 0 : 40,
                  left: languageController.langLocal == eng ? 30 : 0,
                  top: 10, bottom: 10),
              Center(child: TextUtils(title: 'Waiting'.tr).paddingOnly(
                  right: languageController.langLocal == eng ? 5 : 0,
                  left: languageController.langLocal == eng ? 0 : 5,
                  top: 10, bottom: 10)),
              Center(
                child: TextUtils(title: '25/6/2024'.tr).paddingOnly(
                    left: languageController.langLocal == eng ? 0 : 0,
                    right: languageController.langLocal == eng ? 30 : 0,
                    top: 10, bottom: 10),
              ),
              OnHover(
                matrix: 0,
                onTap: (){
                  if (controller!.expanded) {
                    controller?.expanded = false;
                  } else {
                    controller?.expanded = true;
                  }
                },
                builder: (isHovered) {
                  final color = isHovered
                      ? MyThemeData.light.focusColor
                      : MyThemeData.light.primaryColor;
                  return SvgPicture.asset(
                    Images.order_details,
                    width: 30,
                    height: 30,
                    color: color,
                  );
                },
              ).paddingOnly(
                  left: languageController.langLocal == eng ? 0 : 15,
                  right: languageController.langLocal == eng ? 15 : 0,top: 10,bottom: 10),
            ],
          ),
        ],
      ),
      expanded: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.isDesktop(context)
              ? MediaQuery.of(context).size.height * 1 / 2.0
              : MediaQuery.of(context).size.height * 1 / 2.5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.verticalSpace,
            Table(
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.black.withOpacity(0.1)),
                      bottom: BorderSide(color: Colors.black.withOpacity(0.1)),
                    ),
                  ),
                  children: [
                    TextUtils(title: 'Meal Name'.tr).paddingOnly(
                      right: languageController.langLocal == eng ? 0 : 20,
                      left: languageController.langLocal == eng ? 20 : 0,
                    ),
                    TextUtils(title: 'Quantity'.tr).paddingOnly(
                      left: languageController.langLocal == eng ? 0 : 0,
                      right: languageController.langLocal == eng ? 50 : 0,
                    ),
                  ],
                ),
              ],
            ),
            ListView.builder(
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Table(
                  children: [
                    TableRow(
                      children: [
                        const TextUtils(title:'meal name').paddingOnly(
                            right: languageController.langLocal == eng ? 0 : 20,
                            left: languageController.langLocal == eng ? 20 : 0,
                            top: 5,bottom: 5),
                        TextUtils(title: '1'.tr).paddingOnly(
                          left: languageController.langLocal == eng ? 30 : 0,
                          right: languageController.langLocal == eng ? 30 : 10,
                          top: 5,bottom: 5,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
