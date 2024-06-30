import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/home/notification_settings/widget/notification_nav_bar.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_button.dart';
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
          ListView.builder(
            itemCount: notificationStatusList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationStatusList[index],
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
              ).paddingSymmetric(vertical: 11);
            },
          ),
        ],
      ),
    );
  }
}
