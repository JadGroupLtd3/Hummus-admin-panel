import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/feature/category/model/category_model.dart';
import 'package:hummus_admin_panel/feature/language/controller/language_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';
import 'package:hummus_admin_panel/widgets/text_utils.dart';

class TableWidget extends StatelessWidget {
  final bool isCoupon;
  final Category? category;
  final void Function()? onTapDelete;
  final void Function()? onTapEdit;
  final int? length;
  const TableWidget({
    super.key,
    this.isCoupon = false,
    this.category,
    this.length,
    this.onTapDelete,
    this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController =
    Get.find<LanguageController>();
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
                const TextUtils(title: '#', color: Colors.white).paddingOnly(
                    right: languageController.langLocal == eng ? 0 : 20,
                    left: languageController.langLocal == eng ? 20 : 0),
                TextUtils(
                    title: isCoupon ? 'Coupon Name'.tr : 'Image'.tr,
                    color: Colors.white)
                    .paddingOnly(
                    left: languageController.langLocal == eng ? 0 : 30,
                    right: languageController.langLocal == eng ? 30 : 0),
                TextUtils(
                    title: isCoupon ? 'Code'.tr : 'Arabic Name'.tr,
                    color: Colors.white)
                    .paddingOnly(
                    left: languageController.langLocal == eng ? 40 : 0,
                    right: languageController.langLocal == eng ? 0 : 40),
                Center(
                    child: TextUtils(
                        title: isCoupon ? 'Discount'.tr : 'English Name'.tr,
                        color: Colors.white)),
                TextUtils(
                    title: isCoupon ? 'End Date'.tr : 'Hebrew Name'.tr,
                    color: Colors.white),
                TextUtils(title: 'Activation status'.tr, color: Colors.white),
                TextUtils(title: 'Operations'.tr, color: Colors.white)
                    .paddingOnly(
                    left: languageController.langLocal == eng ? 35 : 0,
                    right: languageController.langLocal == eng ? 0 : 35),
              ],
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: length,
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
                        bottom:
                        BorderSide(color: Colors.black.withOpacity(0.1)),
                      ),
                    ),
                    children: [
                      const TextUtils(title: '#').paddingOnly(
                          right: languageController.langLocal == eng ? 0 : 20,
                          left: languageController.langLocal == eng ? 20 : 0,
                          top: 10,
                          bottom: 10),
                      isCoupon
                          ?  TextUtils(title: 'coupon Name').paddingOnly(
                          left: languageController.langLocal == eng ? 0 : 20,
                          right: languageController.langLocal == eng ? 20 : 0,
                          top: 10,
                          bottom: 10)
                          : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          width: 36,
                          height: 36,
                          child: Image.network(
                            category?.image ?? '',
                            height: 36,
                            width: 36,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ).paddingOnly(
                          left:
                          languageController.langLocal == eng ? 0 : 30,
                          right:
                          languageController.langLocal == eng ? 30 : 0,
                          top: 10,
                          bottom: 10),
                      TextUtils(title: category?.nameAr ?? '').paddingOnly(
                          left: languageController.langLocal == eng ? 40 : 0,
                          right: languageController.langLocal == eng ? 0 : 40,
                          top: 10,
                          bottom: 10),
                      Center(
                          child: TextUtils(title: category?.nameEn ?? '')
                              .paddingOnly(top: 10, bottom: 10)),
                      TextUtils(title: category?.nameHe ?? '' )
                          .paddingOnly(top: 10, bottom: 10),
                      Center(
                        child: SvgPicture.asset(
                          Images.dot,
                          width: 25,
                          height: 25,
                        ).paddingOnly(
                            left: languageController.langLocal == eng ? 0 : 18,
                            right: languageController.langLocal == eng ? 18 : 0,
                            top: 10,
                            bottom: 10),
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
                            },
                          ),
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
                            },
                          ),
                        ],
                      ).paddingOnly(
                          left: languageController.langLocal == eng ? 0 : 15,
                          right: languageController.langLocal == eng ? 15 : 0,
                          top: 10,
                          bottom: 10),
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
