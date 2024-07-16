import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/app_constants.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/controller/notification_controller.dart';
import 'package:hummus_admin_panel/feature/language/controller/language_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/text_utils.dart';

class NotificationTableWidget extends StatefulWidget {
  const NotificationTableWidget({
    super.key,
  });

  @override
  State<NotificationTableWidget> createState() => _NotificationTableWidgetState();
}

class _NotificationTableWidgetState extends State<NotificationTableWidget> {
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  void initState() {
    Get.find<NotificationController>().getNotification(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationController) {
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
                    TextUtils(title: 'Address'.tr, color: Colors.white),
                    Center(
                      child: TextUtils(title: 'Kind'.tr, color: Colors.white),
                    ).paddingOnly(
                      right: languageController.langLocal == eng ? 0 : 25,
                      left: languageController.langLocal == eng ? 50 : 0,
                    ),
                    Center(
                        child: TextUtils(
                                title: 'Department'.tr, color: Colors.white)
                            .paddingOnly(
                      left: languageController.langLocal == eng ? 25 : 50,
                    )).paddingOnly(
                      right: languageController.langLocal == eng ? 0 : 60,
                    ),
                    TextUtils(title: 'Meal'.tr, color: Colors.white)
                        .paddingOnly(
                      right: languageController.langLocal == eng ? 0 : 30,
                      left: languageController.langLocal == eng ? 35 : 0,
                    ),
                    TextUtils(title: 'Notice text'.tr, color: Colors.white)
                        .paddingOnly(
                      right: languageController.langLocal == eng ? 0 : 5,
                      left: languageController.langLocal == eng ? 5 : 0,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) {
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
                              right:
                                  languageController.langLocal == eng ? 0 : 20,
                              left:
                                  languageController.langLocal == eng ? 20 : 0,
                              top: 10,
                              bottom: 10),
                          TextUtils(title: 'Address'.tr).paddingOnly(
                              left: languageController.langLocal == eng ? 0 : 0,
                              right:
                                  languageController.langLocal == eng ? 20 : 0,
                              top: 10,
                              bottom: 10),
                          Center(
                            child: TextUtils(title: 'Kind'.tr).paddingOnly(
                                left: languageController.langLocal == eng
                                    ? 20
                                    : 0,
                                right: languageController.langLocal == eng
                                    ? 0
                                    : 20,
                                top: 10,
                                bottom: 10),
                          ),
                          Center(
                              child: TextUtils(title: 'Department'.tr)
                                  .paddingOnly(top: 10, bottom: 10)),
                          TextUtils(title: 'Meal'.tr).paddingOnly(
                            right: languageController.langLocal == eng ? 0 : 27,
                            left: languageController.langLocal == eng ? 27 : 0,
                            top: 10,
                            bottom: 10,
                          ),
                          TextUtils(title: 'Notice text'.tr)
                              .paddingOnly(top: 10, bottom: 10),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
