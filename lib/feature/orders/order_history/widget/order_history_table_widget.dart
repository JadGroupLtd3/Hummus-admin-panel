import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/feature/language/controller/language_controller.dart';
import 'package:hummus_admin_panel/feature/orders/order_history/widget/expanded_order_details.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/text_utils.dart';

class OrderHistoryTableWidget extends StatelessWidget {
  const OrderHistoryTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.find<LanguageController>();
    return Column(
      children: [
        Table(
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
                TextUtils(title: 'Customer'.tr, color: Colors.white)
                    .paddingOnly(left: languageController.langLocal == eng ? 20 : 0,
                    right: languageController.langLocal == eng ? 30 : 0),
                Center(
                  child: TextUtils(title: 'Quantity'.tr, color: Colors.white).paddingOnly(
                      left: languageController.langLocal == eng ? 0 : 40,
                      right: languageController.langLocal == eng ? 40 : 0),
                ),
                Center(child: TextUtils(title: 'Price'.tr, color: Colors.white)).paddingOnly(
                  right: languageController.langLocal == eng ? 60 : 0,
                  left: languageController.langLocal == eng ? 0 : 40,
                ),
                Center(child: TextUtils(title: 'Activation stage'.tr, color: Colors.white)),
                TextUtils(title: 'Date created'.tr, color: Colors.white).paddingOnly(
                  right: languageController.langLocal == eng ? 0 : 30,
                  left: languageController.langLocal == eng ? 15 : 0,
                ),
                TextUtils(title: 'Operations'.tr, color: Colors.white).paddingOnly(
                    left: languageController.langLocal == eng ? 35 : 0,
                    right: languageController.langLocal == eng ? 0 : 35),
              ],
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ExpandedOrderDetails();
            },
          ),
        ),
      ],
    );
  }
}