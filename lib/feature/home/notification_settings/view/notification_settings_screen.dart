import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/widget/notification_nav_bar.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/widget/notification_status_widget.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: GetBuilder<NotificationController>(
            builder: (notificationController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'Home'.tr} / ${'Notification'.tr} / ${'Notification Settings'.tr}',
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<SliderPagesController>(
                        builder: (sliderPagesController) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            height: MediaQuery.of(context).size.height * 1 / 1.4,
                            width: MediaQuery.of(context).size.height * 1 / 1.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 0),
                                  color: Colors.black.withOpacity(0.02),
                                  blurRadius: 14,
                                  spreadRadius: 9,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                NotificationNavBar(
                                  sliderPagesController:
                                      sliderPagesController,
                                ),
                                20.verticalSpace,
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      1 /
                                      1.77,
                                  child: PageView(
                                    onPageChanged: sliderPagesController
                                        .animateToNotificationNameTab,
                                    controller: sliderPagesController
                                        .notificationPageController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    clipBehavior: Clip.none,
                                    children: [
                                      ...sliderPagesController
                                          .notificationNamesPages
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      7.horizontalSpace,
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        margin: const EdgeInsets.only(top: 20),
                        height: MediaQuery.of(context).size.height * 1 / 1.6,
                        width: MediaQuery.of(context).size.height * 1 / 1.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 14,
                              spreadRadius: 9,
                            )
                          ],
                        ),
                        child: const NotificationStatusWidget(),
                      ),
                    ],
                  ),
                  Obx(() {
                    switch (notificationController.controllerState.value) {
                      case ControllerState.loading:
                        return Center(
                          child: CircularProgressIndicator(
                            color: MyThemeData.light.primaryColor,
                          ),
                        );
                      case ControllerState.error:
                        return Center(
                          child: CustomButton(
                            buttonText: 'save'.tr,
                            icon: SvgPicture.asset(Images.correct)
                                .paddingSymmetric(horizontal: 4),
                            style: TajawalBold.copyWith(
                              color: Colors.white,
                            ),
                            radius: 20,
                            width: 160,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: () {
                              notificationController.createNotificationStatus(context);
                            },
                          ),
                        );
                      default:
                        return Center(
                          child: CustomButton(
                            buttonText: 'save'.tr,
                            icon: SvgPicture.asset(Images.correct)
                                .paddingSymmetric(horizontal: 4),
                            style: TajawalBold.copyWith(
                              color: Colors.white,
                            ),
                            radius: 20,
                            width: 160,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: () {
                              notificationController.createNotificationStatus(context);
                            },
                          ),
                        );
                    }
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
