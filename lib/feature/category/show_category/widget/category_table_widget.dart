import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/feature/category/controller/category_controller.dart';
import 'package:hummus_admin_panel/feature/language/controller/language_controller.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';
import 'package:hummus_admin_panel/widgets/text_utils.dart';

class CategoryTableWidget extends StatefulWidget {
  const CategoryTableWidget({super.key});

  @override
  State<CategoryTableWidget> createState() => _CategoryTableWidgetState();
}

class _CategoryTableWidgetState extends State<CategoryTableWidget> {
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  void initState() {
    Get.find<CategoryController>().getCategory(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) {
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
                        .paddingOnly(
                            right: languageController.langLocal == eng ? 0 : 20,
                            left: languageController.langLocal == eng ? 20 : 0),
                    TextUtils(title: 'Image'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 0 : 30,
                            right:
                                languageController.langLocal == eng ? 30 : 0),
                    TextUtils(title: 'Arabic Name'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 40 : 0,
                            right:
                                languageController.langLocal == eng ? 0 : 40),
                    Center(
                        child: TextUtils(
                            title: 'English Name'.tr, color: Colors.white)),
                    TextUtils(title: 'Hebrew Name'.tr, color: Colors.white),
                    TextUtils(
                        title: 'Activation status'.tr, color: Colors.white),
                    TextUtils(title: 'Operations'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 35 : 0,
                            right:
                                languageController.langLocal == eng ? 0 : 35),
                  ],
                ),
              ],
            ),
            Obx(
              () {
                if (controller.controllerState.value ==
                    ControllerState.loading) {
                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      Center(
                        child: CircularProgressIndicator(
                          color: MyThemeData.light.primaryColor,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.categoryList.length,
                      itemBuilder: (context, index) {
                        final category = controller.categoryList[index];
                        return Table(
                          columnWidths: const {
                            1: IntrinsicColumnWidth(),
                          },
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: Colors.black.withOpacity(0.1)),
                                  bottom: BorderSide(
                                      color: Colors.black.withOpacity(0.1)),
                                ),
                              ),
                              children: [
                                const TextUtils(title: '#').paddingOnly(
                                    right: languageController.langLocal == eng
                                        ? 0
                                        : 20,
                                    left: languageController.langLocal == eng
                                        ? 20
                                        : 0,
                                    top: 10,
                                    bottom: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: SizedBox(
                                    width: 36,
                                    height: 36,
                                    child: Image.network(
                                      category.image ?? '',
                                      height: 36,
                                      width: 36,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ).paddingOnly(
                                    left: languageController.langLocal == eng
                                        ? 0
                                        : 30,
                                    right: languageController.langLocal == eng
                                        ? 30
                                        : 0,
                                    top: 10,
                                    bottom: 10),
                                TextUtils(title: category.nameAr ?? '')
                                    .paddingOnly(
                                        left:
                                            languageController
                                                        .langLocal ==
                                                    eng
                                                ? 60
                                                : 0,
                                        right:
                                            languageController.langLocal == eng
                                                ? 0
                                                : 60,
                                        top: 10,
                                        bottom: 10),
                                Center(
                                    child:
                                        TextUtils(title: category.nameEn ?? '')
                                            .paddingOnly(top: 10, bottom: 10)),
                                TextUtils(title: category.nameHe ?? '')
                                    .paddingOnly(
                                        left:
                                            languageController
                                                        .langLocal ==
                                                    eng
                                                ? 20
                                                : 0,
                                        right:
                                            languageController.langLocal == eng
                                                ? 0
                                                : 20,
                                        top: 10,
                                        bottom: 10),
                                Center(
                                  child: SvgPicture.asset(
                                    Images.dot,
                                    width: 25,
                                    height: 25,
                                    color: category.status == 1
                                        ? MyThemeData.light.primaryColor
                                        : Colors.red,
                                  ).paddingOnly(
                                      left: languageController.langLocal == eng
                                          ? 0
                                          : 18,
                                      right: languageController.langLocal == eng
                                          ? 18
                                          : 0,
                                      top: 10,
                                      bottom: 10),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OnHover(
                                      matrix: 0,
                                      onTap: () {},
                                      builder: (isHovered) {
                                        return SvgPicture.asset(
                                          Images.edit,
                                          width: 30,
                                          height: 30,
                                        );
                                      },
                                    ),
                                    5.horizontalSpace,
                                    OnHover(
                                      matrix: 0,
                                      onTap: () {},
                                      builder: (isHovered) {
                                        return SvgPicture.asset(
                                          Images.delete,
                                          width: 30,
                                          height: 30,
                                        );
                                      },
                                    ),
                                  ],
                                ).paddingOnly(
                                    left: languageController.langLocal == eng
                                        ? 0
                                        : 15,
                                    right: languageController.langLocal == eng
                                        ? 15
                                        : 0,
                                    top: 10,
                                    bottom: 10),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
