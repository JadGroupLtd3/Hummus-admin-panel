import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/show_notifications/controller/push_notification_controller.dart';

class NotificationTableWidget extends StatefulWidget {
  const NotificationTableWidget({super.key});
  @override
  State<NotificationTableWidget> createState() => _NotificationTableWidgetState();
}

class _NotificationTableWidgetState extends State<NotificationTableWidget> {
  final LanguageController languageController = Get.find<LanguageController>();
  @override
  void initState() {
    Get.find<PushNotificationController>().getPushNotification(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PushNotificationController>(
      builder: (pushNotificationController) {
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
                    TextUtils(title: ''.tr, color: Colors.white)
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
            Obx(
              () {
                if (pushNotificationController.controllerState.value ==
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
                      itemCount: pushNotificationController
                          .pushNotificationList.length,
                      itemBuilder: (context, index) {
                        final notification = pushNotificationController
                            .pushNotificationList[index];
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
                                TextUtils(title: '${index + 1}').paddingOnly(
                                    right: languageController.langLocal == eng
                                        ? 0
                                        : 20,
                                    left: languageController.langLocal == eng
                                        ? 20
                                        : 0,
                                    top: 10,
                                    bottom: 10),
                                TextUtils(
                                        title: languageController.langLocal ==
                                                eng
                                            ? notification.titleEn
                                            : languageController.langLocal ==
                                                    ara
                                                ? notification.titleAr
                                                : notification.titleHe)
                                    .paddingOnly(
                                        left:
                                            languageController.langLocal == eng
                                                ? 0
                                                : 0,
                                        right:
                                            languageController.langLocal == eng
                                                ? 20
                                                : 0,
                                        top: 10,
                                        bottom: 10),
                                Center(
                                  child: TextUtils(title:
                                  notification.type == "cat_id"
                                      ? 'Category'.tr
                                      : "Meal".tr)
                                      .paddingOnly(
                                          left: languageController.langLocal ==
                                                  eng
                                              ? 20
                                              : 0,
                                          right: languageController.langLocal ==
                                                  eng
                                              ? 0
                                              : 20,
                                          top: 10,
                                          bottom: 10),
                                ),
                                Center(
                                    child: TextUtils(
                                            title: languageController
                                                        .langLocal ==
                                                    eng
                                                ? notification.category?.nameEn ?? ''
                                                : languageController
                                                            .langLocal ==
                                                        ara
                                                    ? notification
                                                        .category?.nameAr ?? ''
                                                    : notification
                                                        .category?.nameHe ?? '')
                                        .paddingOnly(top: 10, bottom: 10)),
                                const TextUtils(title: '').paddingOnly(
                                  right: languageController.langLocal == eng
                                      ? 0
                                      : 27,
                                  left: languageController.langLocal == eng
                                      ? 27
                                      : 0,
                                  top: 10,
                                  bottom: 10,
                                ),
                                TextUtils(
                                        title: languageController.langLocal ==
                                                eng
                                            ? notification.descriptionEn
                                            : languageController.langLocal ==
                                                    ara
                                                ? notification.descriptionAr
                                                : notification.descriptionHe)
                                    .paddingOnly(top: 10, bottom: 10),
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
