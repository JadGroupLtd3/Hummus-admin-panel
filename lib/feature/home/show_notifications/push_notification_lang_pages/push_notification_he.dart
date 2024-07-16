import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/show_notifications/controller/push_notification_controller.dart';

class PushNotificationHe extends StatelessWidget {
  const PushNotificationHe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: GetBuilder<PushNotificationController>(
          builder: (pushNotificationController) {
            return Form(
              key: pushNotificationController.notificationKeyHe,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField2(
                        title: 'Address'.tr,
                        height: 51,
                        width: 369,
                        radius: 200,
                        filled: false,
                        controller: pushNotificationController.titleNotificationHe,
                      ),
                      AddPhotoWidget(
                        height: 120,
                        width: 140,
                        isNotificationHe: true,
                        webImage: pushNotificationController.webImageHe,
                        pickedProfileImageFile: pushNotificationController.pickedProfileImageFileHe,
                      ).paddingSymmetric(horizontal: 20),
                    ],
                  ),
                  10.verticalSpace,
                  Text(
                    'Text of notification'.tr,
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ).paddingAll(5),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      minLines: 10,
                      maxLines: 15,
                      controller: pushNotificationController.descriptionNotificationHe,
                      style: TajawalRegular.copyWith(
                        fontSize: 16,
                      ),
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xff000000).withOpacity(0.11),
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xff000000).withOpacity(0.11),
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xff000000).withOpacity(0.11),
                              width: 1,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                      ),
                      validator: (String? value) {
                        if (value == null) {
                          return 'Field is required'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  10.verticalSpace,
                ],
              ),
            );
          },
        ));
  }
}