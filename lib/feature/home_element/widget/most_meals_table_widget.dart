import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/feature/language/controller/language_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';
import 'package:hummus_admin_panel/widgets/text_utils.dart';

class MostMealsTableWidget extends StatelessWidget {
  const MostMealsTableWidget({super.key});


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
                const TextUtils(title: 'Image', color: Colors.white)
                    .paddingOnly(left: languageController.langLocal == eng ? 0 : 30,
                right: languageController.langLocal == eng ? 30 : 0),
                const TextUtils(title: 'Meal name', color: Colors.white).paddingOnly(
                    left: languageController.langLocal == eng ? 40 : 0,
                    right: languageController.langLocal == eng ? 0 : 40),
                const Center(child: TextUtils(title: 'Actual price', color: Colors.white)),
                const Center(child: TextUtils(title: 'Fake price', color: Colors.white)),
                const Center(child: TextUtils(title: 'Section', color: Colors.white)),
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
            itemCount: 5,
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
                      const TextUtils(title: 'Meal name').paddingOnly(
                          left: languageController.langLocal == eng ? 40 : 0,
                          right: languageController.langLocal == eng ? 0 : 40 ,top: 10,bottom: 10),
                      Center(child: const TextUtils(title: '\$15').paddingOnly(top: 10, bottom: 10)),
                      Center(child: const TextUtils(title: '\$20').paddingOnly(top: 10, bottom: 10)),
                      Center(child: const TextUtils(title: 'Category').paddingOnly(top: 10, bottom: 10)),
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
                      OnHover(
                        matrix: 0,
                        builder: (isHovered) {
                        return SvgPicture.asset(
                          Images.delete,
                          width: 30,
                          height: 30,
                        );
                      },).paddingOnly(
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

