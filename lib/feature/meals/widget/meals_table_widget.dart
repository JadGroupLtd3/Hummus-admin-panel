import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/feature/language/controller/language_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';
import 'package:hummus_admin_panel/widgets/text_utils.dart';

class MealsTableWidget extends StatelessWidget {
  final bool isDeal;
  final void Function()? onTapEdit;
  final void Function()? onTapDelete;
  const MealsTableWidget({super.key,this.isDeal = false,this.onTapEdit,this.onTapDelete});


  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.find<LanguageController>();
    return Column(
      children: [
        Table(
          columnWidths: const {
            1: IntrinsicColumnWidth(),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: MyThemeData.light.focusColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              children: [
                const TextUtils(title: '#', color: Colors.white)
                    .paddingOnly(right: languageController.langLocal == eng ? 0 : 20,
                left: languageController.langLocal == eng ? 20 : 0),
                TextUtils(title: 'Image'.tr, color: Colors.white)
                    .paddingOnly(left: languageController.langLocal == eng ? 0 : 30,
                right: languageController.langLocal == eng ? 30 : 0),
                TextUtils(title: isDeal ? 'Deal name'.tr : 'Meal name'.tr, color: Colors.white).paddingOnly(
                    left: languageController.langLocal == eng ? 40 : 0,
                    right: languageController.langLocal == eng ? 0 : 40),
                Center(child: TextUtils(title: isDeal ? 'price'.tr : 'Fake price'.tr, color: Colors.white)),
                TextUtils(title: isDeal ? 'starting date'.tr : 'Actual price'.tr, color: Colors.white),
                TextUtils(title: isDeal ? 'Expiry date'.tr : 'Category'.tr, color: Colors.white),
                const TextUtils(title: 'Activation status', color: Colors.white),
                const TextUtils(title: 'Operations', color: Colors.white).paddingOnly(
                    left: languageController.langLocal == eng ? 20 : 0,
                    right: languageController.langLocal == eng ? 0 : 20),
              ],
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Table(
                columnWidths: const {
                  1: IntrinsicColumnWidth(),
                },
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          width: 36,
                          height: 36,
                          child: Image.asset(
                            Images.background,
                            height: 36,
                            width: 36,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ).paddingOnly(
                          left: languageController.langLocal == eng ? 0 : 30,
                          right: languageController.langLocal == eng ? 30 : 0,top: 10,bottom: 10),
                      TextUtils(title: isDeal ? 'deal name' : 'meal name').paddingOnly(
                          left: languageController.langLocal == eng ? 40 : 0,
                          right: languageController.langLocal == eng ? 0 : 40 ,top: 10,bottom: 10),
                      Center(child: const TextUtils(title: '\$15').paddingOnly(top: 10, bottom: 10)),
                      TextUtils(title: isDeal ? '01/06/2024' : '\$10')
                          .paddingOnly(
                          right: isDeal ? 0 : 25,
                          left: languageController.langLocal == eng && !isDeal ? 25 : 0,
                          top: 10, bottom: 10),
                      TextUtils(title: isDeal ? '30/06/2024' : 'category').paddingOnly(top: 10, bottom: 10),
                      Center(
                        child: SvgPicture.asset(
                          Images.dot,
                          width: 25,
                          height: 25,
                        ).paddingOnly(
                            left: languageController.langLocal == eng ? 0 : 18,
                            right: languageController.langLocal == eng ? 18 : 0,
                            top: 10, bottom: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OnHover(
                            matrix: 0,
                            onTap: onTapEdit,
                            builder: (isHovered) {
                            return SvgPicture.asset(
                              Images.edit,
                              width: 30,
                              height: 30,
                            );
                          },),
                          5.horizontalSpace,
                          OnHover(
                            matrix: 0,
                            onTap: onTapDelete,
                            builder: (isHovered) {
                            return SvgPicture.asset(
                              Images.delete,
                              width: 30,
                              height: 30,
                            );
                          },),
                        ],
                      ).paddingOnly(
                          left: languageController.langLocal == eng ? 0 : 15,
                          right: languageController.langLocal == eng ? 15 : 0,top: 10,bottom: 10),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

