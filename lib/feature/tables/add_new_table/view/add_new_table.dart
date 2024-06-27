import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_button.dart';
import 'package:hummus_admin_panel/widgets/custom_switch.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field.dart';

class AddNewTable extends StatelessWidget {
  const AddNewTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool _enable = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${'Home'.tr} / ${'Tables'.tr} / ${'Add New'.tr}',
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
              12.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    height: MediaQuery.of(context).size.height * 1 / 2.0,
                    width: MediaQuery.of(context).size.height * 1 / 1.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 14,
                          spreadRadius: 9,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.verticalSpace,
                                Text(
                                  'Table Number'.tr,
                                  style: TajawalRegular.copyWith(
                                    fontSize: 14,
                                  ),
                                ).paddingSymmetric(horizontal: 10),
                                10.verticalSpace,
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
                                    hintText: 'Table Number'.tr,
                                    height: 45,
                                    radius: 15,
                                    inputType: TextInputType.text,
                                  ),
                                ),
                                30.verticalSpace,
                                CustomSwitch(
                                  value: _enable,
                                  onChanged: (bool val) {
                                    _enable = val;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                buttonText: 'save'.tr,
                                icon: SvgPicture.asset(Images.correct).paddingSymmetric(horizontal: 4),
                                style: TajawalBold.copyWith(
                                  color: Colors.white,
                                ),
                                radius: 20,
                                width: 160,
                                height: 45,
                                backGroundColor: MyThemeData.light.primaryColor,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
