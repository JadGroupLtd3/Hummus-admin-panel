import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/widgets/custom_switch.dart';

class NotificationStatusWidget extends StatelessWidget {
  NotificationStatusWidget({super.key});

  var notificationStatusList =[
    'New Order'.tr,
    'Request Accept',
    'Rejection of the application',
    'Execute the request',
    'Pickup from the store',
    'Waiting to receive the delivery',
    'on my way',
    'sent delivered handed',
  ];

  @override
  Widget build(BuildContext context) {
    bool _enable = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 18),
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationStatusList[0],
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  CustomSwitch(
                    value: _enable,
                    onChanged: (val) {
                      _enable = val;
                    },
                  ),
                ],
              ).paddingSymmetric(vertical: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationStatusList[1],
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  CustomSwitch(
                    value: _enable,
                    onChanged: (val) {
                      _enable = val;
                    },
                  ),
                ],
              ).paddingSymmetric(vertical: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationStatusList[2],
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  CustomSwitch(
                    value: _enable,
                    onChanged: (val) {
                      _enable = val;
                    },
                  ),
                ],
              ).paddingSymmetric(vertical: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationStatusList[3],
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  CustomSwitch(
                    value: _enable,
                    onChanged: (val) {
                      _enable = val;
                    },
                  ),
                ],
              ).paddingSymmetric(vertical: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationStatusList[4],
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  CustomSwitch(
                    value: _enable,
                    onChanged: (val) {
                      _enable = val;
                    },
                  ),
                ],
              ).paddingSymmetric(vertical: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationStatusList[5],
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  CustomSwitch(
                    value: _enable,
                    onChanged: (val) {
                      _enable = val;
                    },
                  ),
                ],
              ).paddingSymmetric(vertical: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationStatusList[6],
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  CustomSwitch(
                    value: _enable,
                    onChanged: (val) {
                      _enable = val;
                    },
                  ),
                ],
              ).paddingSymmetric(vertical: 11),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationStatusList[7],
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  CustomSwitch(
                    value: _enable,
                    onChanged: (val) {
                      _enable = val;
                    },
                  ),
                ],
              ).paddingSymmetric(vertical: 11),
            ],
          ),
        ],
      ),
    );
  }
}
