import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/widgets/custom_switch.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field.dart';

class AddNewProductFields extends StatefulWidget {
  final bool isCoupon;
  final TextEditingController? controllerAR;
  final TextEditingController? controllerEN;
  final TextEditingController? controllerHE;
  final TextEditingController? sort;
  final bool isCategory;
  final GlobalKey<FormState> fieldsKey;
  bool? enable;
  void Function(bool)? onChanged;

  AddNewProductFields({
    super.key,
    this.isCoupon = false,
    this.controllerAR,
    this.controllerEN,
    this.controllerHE,
    this.sort,
    this.onChanged,
    this.enable,
    required this.fieldsKey,
    this.isCategory = false,
  });

  @override
  State<AddNewProductFields> createState() => _AddNewProductFieldsState();
}

class _AddNewProductFieldsState extends State<AddNewProductFields> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Form(
        key: widget.fieldsKey,
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
                controller: widget.controllerAR,
                onValidate: (String? value) {
                  if(value == null){
                    return 'field is required'.tr;
                  }
                  return null;
                },
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
              child: CustomTextField(
                hintText: 'English Name'.tr,
                height: 45,
                radius: 15,
                inputType: TextInputType.text,
                controller: widget.controllerEN,
                onValidate: (String? value) {
                  if(value == null){
                    return 'field is required'.tr;
                  }
                  return null;
                },
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
                controller: widget.controllerHE,
                onValidate: (String? value) {
                  if(value == null){
                    return 'field is required'.tr;
                  }
                  return null;
                },
              ),
            ),
            widget.isCategory ? 30.verticalSpace : 0.verticalSpace,
            widget.isCategory
                ? Text(
                    'Sort'.tr,
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ).paddingSymmetric(horizontal: 10)
                : 0.verticalSpace,
            widget.isCategory ? 3.verticalSpace : 0.verticalSpace,
            widget.isCategory
                ? Container(
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
                      hintText: 'Sort'.tr,
                      height: 45,
                      radius: 15,
                      inputType: TextInputType.phone,
                      controller: widget.sort,
                      onValidate: (String? value) {
                        if(value == null){
                          return 'field is required'.tr;
                        }
                        return null;
                      },
                    ),
                  )
                : 0.verticalSpace,
            widget.isCoupon ? const SizedBox.shrink() : 40.verticalSpace,
            widget.isCoupon
                ? const SizedBox.shrink()
                : Center(
                    child: CustomSwitch(
                      value: widget.enable ?? false,
                      onChanged: widget.onChanged ?? (bool val) {
                        setState(() {
                            widget.enable = val;
                        });
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
