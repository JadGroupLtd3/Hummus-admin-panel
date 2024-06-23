import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/helper/responsive_helper.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_switch.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field.dart';

class TimeWidget extends StatelessWidget {
  final String day;
  const TimeWidget({super.key,required this.day});

  @override
  Widget build(BuildContext context) {
    bool _enable = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: ResponsiveHelper.isDesktop(context)
              ? MediaQuery.of(context).size.height * 1 / 2.8
              : MediaQuery.of(context).size.height * 1 / 3.3,
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MyThemeData.light.backgroundColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(0.03),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              10.horizontalSpace,
              Icon(
                Icons.date_range_outlined,
                color: MyThemeData.light.primaryColor,
              ),
              10.horizontalSpace,
              Text(
                day,
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: ResponsiveHelper.isDesktop(context)
                  ? MediaQuery.of(context).size.height * 1 / 2.5
                  : MediaQuery.of(context).size.height * 1 / 3.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    color: Colors.black.withOpacity(0.22),
                    blurRadius: 8,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: CustomTextField(
                height: 45,
                radius: 15,
                hintText: '00:00 AM'.tr,
                inputType: TextInputType.phone,
                //controller: controller.workController,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              'To'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 15),
            Container(
             width: ResponsiveHelper.isDesktop(context)
                  ? MediaQuery.of(context).size.height * 1 / 2.5
                  : MediaQuery.of(context).size.height * 1 / 3.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    color: Colors.black.withOpacity(0.22),
                    blurRadius: 8,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: CustomTextField(
                height: 45,
                radius: 15,
                hintText: '00:00 PM'.tr,
                inputType: TextInputType.phone,
                //controller: controller.workController,
              ),
            ),
          ],
        ),
        CustomSwitch(
          value: _enable,
          onChanged: (val) {
            _enable = val;
          },
        )
      ],
    ).paddingSymmetric(vertical: 8);
  }
}
