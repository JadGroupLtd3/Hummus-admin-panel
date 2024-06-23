import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/widgets/custom_switch.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field.dart';

class AddressTextField extends StatefulWidget {
  const AddressTextField({super.key});

  @override
  State<AddressTextField> createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<AddressTextField> {
  bool _enable = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20,
                color: MyThemeData.light.focusColor,
              ).paddingSymmetric(horizontal: 7),
              Text(
                'Address'.tr,
                style: TajawalRegular.copyWith(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          CustomTextField(
            height: 45,
            radius: 20,
            hintText: 'Address'.tr,
            inputType: TextInputType.text,
            //controller: controller.workController,
          ),
          30.verticalSpace,
          Text(
            'Activation status'.tr,
            style: TajawalRegular.copyWith(
              fontSize: 15,
            ),
          ),
          20.verticalSpace,
          CustomSwitch(
            value: _enable,
            onChanged: (bool val) {
              setState(() {
                _enable = val;
              });
            },
          ).paddingSymmetric(horizontal: 10),
        ],
      ),
    );
  }
}
