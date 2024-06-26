import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/coupon/add_new_coupon/widget/drop_down_btn.dart';
import 'package:hummus_admin_panel/widgets/custom_switch.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field2.dart';
import 'package:hummus_admin_panel/widgets/custome_date_time_picker.dart';
import 'package:intl/intl.dart';

class CouponDetailsFields extends StatefulWidget {
  const CouponDetailsFields({super.key});

  @override
  State<CouponDetailsFields> createState() => _CouponDetailsFieldsState();
}

class _CouponDetailsFieldsState extends State<CouponDetailsFields> {
  late TextEditingController _timeController;
  final GlobalKey<FormState> couponKey = GlobalKey<FormState>();
  bool _enable = false;
  String? _dropDownValue;
  @override
  void initState() {
    super.initState();
    _timeController = TextEditingController();
  }

  Future<void> selectDateTime(BuildContext context) async {
    DateTime initialDateTime = DateTime.now();
    final DateTime? pickedDateTime = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DateTimePickerDialog(initialDateTime: initialDateTime);
      },
    );
    if (pickedDateTime != null) {
      _timeController.text = DateFormat('yyyy-MM-dd hh:mm a').format(pickedDateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: couponKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField2(
                            title: 'Code'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'Code'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            //controller: controller.workController,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CustomTextField2(
                            title: 'Number of uses per laser'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'Number of uses per laser'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            //controller: controller.workController,
                          ),
                        ),
                      ],
                    ),
                    17.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField2(
                            title: 'Number of times the coupon was used'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'Number of times the coupon was used'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            //controller: controller.workController,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CustomTextField2(
                            title: 'Discount'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'Discount'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            //controller: controller.workController,
                          ),
                        ),
                      ],
                    ),
                    17.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                                child: Text(
                                  'Type of discount'.tr,
                                  style: TajawalRegular.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DropDownBTN(
                                title: 'Type of discount'.tr,
                              ),
                              const SizedBox(height:22),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CustomTextField2(
                            title: 'The lowest invoice price'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'The lowest invoice price'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                          ),
                        ),
                      ],
                    ),
                    17.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField2(
                            title: 'Expiry date'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'dd/mm/yy, --:-- --'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            controller: _timeController,
                            onTap: () async {
                             await selectDateTime(context);
                            },
                            //controller: controller.workController,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                                child: Text(
                                  'Assign to a user'.tr,
                                  style: TajawalRegular.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DropDownBTN(
                                title: 'Assign to a user'.tr,
                              ),
                              const SizedBox(height:14),
                            ],
                          ),
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    Center(
                      child: CustomSwitch(
                        value: _enable,
                        onChanged: (bool val) {
                          _enable = val;
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
