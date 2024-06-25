import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/widgets/custom_switch.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field.dart';

class AddNewProductFields extends StatefulWidget {
  const AddNewProductFields({super.key});

  @override
  State<AddNewProductFields> createState() => _AddNewProductFieldsState();
}

class _AddNewProductFieldsState extends State<AddNewProductFields> {
  bool _enable = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          5.verticalSpace,
          Text(
            'Arabic Name'.tr,
            style: TajawalRegular.copyWith(
              fontSize: 14,
            ),
          ).paddingSymmetric(horizontal: 10),
          3.verticalSpace,
          Container(
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
              hintText: 'Arabic Name'.tr,
              height: 45,
              radius: 15,
              inputType: TextInputType.text,
            ),
          ),
          30.verticalSpace,
          Text(
            'English Name'.tr,
            style: TajawalRegular.copyWith(
              fontSize: 14,
            ),
          ).paddingSymmetric(horizontal: 10),
          3.verticalSpace,
          Container(
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
            child:  CustomTextField(
              hintText: 'English Name'.tr,
              height: 45,
              radius: 15,
              inputType: TextInputType.text,
            ),
          ),
          30.verticalSpace,
          Text(
            'Hebrew Name'.tr,
            style: TajawalRegular.copyWith(
              fontSize: 14,
            ),
          ).paddingSymmetric(horizontal: 10),
          3.verticalSpace,
          Container(
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
              hintText: 'Hebrew Name'.tr,
              height: 45,
              radius: 15,
              inputType: TextInputType.text,
            ),
          ),
          40.verticalSpace,
          Center(
            child: CustomSwitch(
              value: _enable,
              onChanged: (bool val) {
                setState(() {
                  _enable = val;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
