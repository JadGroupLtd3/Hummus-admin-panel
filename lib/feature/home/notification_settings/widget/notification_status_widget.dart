import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/controller/notification_controller.dart';
import 'package:hummus_admin_panel/widgets/custom_switch.dart';

class NotificationStatusWidget extends StatefulWidget {
  const NotificationStatusWidget({super.key});

  @override
  State<NotificationStatusWidget> createState() => _NotificationStatusWidgetState();
}

class _NotificationStatusWidgetState extends State<NotificationStatusWidget> {
  final NotificationController notificationController = Get.find<NotificationController>();

  @override
  void initState() {
    notificationController.getNotification(context);
    notificationController.isEdit(notificationController.notificationData.value!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 18),
      child: GetBuilder<NotificationController>(
        builder: (notificationController) {
          return Column(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Order'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      CustomSwitch(
                        value: notificationController.newOrderStatus.value,
                        onChanged: (val) {
                          val == true
                              ? notificationController.newOrderStatus.value = true
                              : notificationController.newOrderStatus.value = false;
                          notificationController.updateNotificationStatus(
                            context,
                            key: 'new_order_status',
                            value: notificationController.newOrderStatus.value == true ? 1 : 0,
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(vertical: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Request Accept'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      CustomSwitch(
                        value: notificationController.requestAcceptStatus.value,
                        onChanged: (val) {
                          val == true
                              ? notificationController.requestAcceptStatus.value = true
                              : notificationController.requestAcceptStatus.value = false;
                          notificationController.updateNotificationStatus(
                            context,
                            key: 'order_accept_status',
                            value: notificationController.requestAcceptStatus.value == true ? 1 : 0,
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(vertical: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rejection of the application'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      CustomSwitch(
                        value: notificationController.rejectionOfTheApplicationStatus.value,
                        onChanged: (val) {
                          val == true
                              ? notificationController.rejectionOfTheApplicationStatus.value = true
                              : notificationController.rejectionOfTheApplicationStatus.value = false;
                          notificationController.updateNotificationStatus(
                            context,
                            key: 'order_reject_status',
                            value: notificationController.rejectionOfTheApplicationStatus.value == true ? 1 : 0,
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(vertical: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Execute the request'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      CustomSwitch(
                        value: notificationController.executeTheRequestStatus.value,
                        onChanged: (val) {
                          val == true
                              ? notificationController.executeTheRequestStatus.value = true
                              : notificationController.executeTheRequestStatus.value = false;
                          notificationController.updateNotificationStatus(
                            context,
                            key: 'order_preparing_status',
                            value: notificationController.executeTheRequestStatus.value == true ? 1 : 0,
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(vertical: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pickup from the store'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      CustomSwitch(
                        value: notificationController.pickupFromTheStoreStatus.value,
                        onChanged: (val) {
                          val == true
                              ? notificationController.pickupFromTheStoreStatus.value = true
                              : notificationController.pickupFromTheStoreStatus.value = false;
                          notificationController.updateNotificationStatus(
                            context,
                            key: 'order_waiting_pickup_status',
                            value: notificationController.pickupFromTheStoreStatus.value == true ? 1 : 0,
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(vertical: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Waiting to receive the delivery'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      CustomSwitch(
                        value: notificationController.waitingToReceiveTheDeliveryStatus.value,
                        onChanged: (val) {
                          val == true
                              ? notificationController.waitingToReceiveTheDeliveryStatus.value = true
                              : notificationController.waitingToReceiveTheDeliveryStatus.value = false;
                          notificationController.updateNotificationStatus(
                            context,
                            key: 'order_waiting_delivery_status',
                            value: notificationController.waitingToReceiveTheDeliveryStatus.value == true ? 1 : 0,
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(vertical: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'on my way'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      CustomSwitch(
                        value: notificationController.onMyWayStatus.value,
                        onChanged: (val) {
                          val == true
                              ? notificationController.onMyWayStatus.value = true
                              : notificationController.onMyWayStatus.value = false;
                          notificationController.updateNotificationStatus(
                            context,
                            key: 'order_on_the_way_status',
                            value: notificationController.onMyWayStatus.value == true ? 1 : 0,
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(vertical: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'sent delivered handed'.tr,
                        style: TajawalRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      CustomSwitch(
                        value: notificationController.doneStatus.value,
                        onChanged: (val) {
                          val == true
                              ? notificationController.doneStatus.value = true
                              : notificationController.doneStatus.value = false;
                          notificationController.updateNotificationStatus(
                            context,
                            key: 'order_done_status',
                            value: notificationController.doneStatus.value == true ? 1 : 0,
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(vertical: 11),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
