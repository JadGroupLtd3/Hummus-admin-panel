import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_button.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field.dart';

class AccountInformationFields extends StatelessWidget {
  AccountInformationFields({super.key});

  final GlobalKey<FormState> informationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Image.asset(
                Images.logo2,
                width: 130,
                height: 90,
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: informationKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.work_outline,
                                    size: 20,
                                    color: MyThemeData.light.focusColor,
                                  ).paddingSymmetric(horizontal: 7),
                                  
                                  Text(
                                    'Activity name'.tr,
                                    style: TajawalRegular.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                height: 45,
                                radius: 20,
                                hintText: 'Activity name'.tr,
                                inputType: TextInputType.text,
                                //controller: controller.workController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.email,
                                    size: 20,
                                    color: MyThemeData.light.focusColor,
                                  ).paddingSymmetric(horizontal: 7),
                                  
                                  Text(
                                    'Email'.tr,
                                    style: TajawalRegular.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                height: 45,
                                radius: 20,
                                hintText: 'Email'.tr,
                                inputType: TextInputType.text,
                                //controller: controller.workController,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    25.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    size: 20,
                                    color: MyThemeData.light.focusColor,
                                  ).paddingSymmetric(horizontal: 7),
                                  
                                  Text(
                                    'Phone Number'.tr,
                                    style: TajawalRegular.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                height: 45,
                                radius: 20,
                                hintText: 'Phone Number'.tr,
                                inputType: TextInputType.text,
                                //controller: controller.workController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.numbers_outlined,
                                    size: 20,
                                    color: MyThemeData.light.focusColor,
                                  ).paddingSymmetric(horizontal: 7),
                                  
                                  Text(
                                    'Tax Number'.tr,
                                    style: TajawalRegular.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                height: 45,
                                radius: 20,
                                hintText: 'Tax Number'.tr,
                                inputType: TextInputType.phone,
                                //controller: controller.workController,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    25.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 20,
                                    color: MyThemeData.light.focusColor,
                                  ).paddingSymmetric(horizontal: 7),
                                  
                                  Text(
                                    'Evaluate maps'.tr,
                                    style: TajawalRegular.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                height: 45,
                                radius: 20,
                                hintText: 'Evaluate maps'.tr,
                                inputType: TextInputType.text,
                                //controller: controller.workController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.fax_outlined,
                                    size: 20,
                                    color: MyThemeData.light.focusColor,
                                  ).paddingSymmetric(horizontal: 7),
                                  
                                  Text(
                                    'Fax Number'.tr,
                                    style: TajawalRegular.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                height: 45,
                                radius: 20,
                                hintText: 'Fax Number'.tr,
                                inputType: TextInputType.phone,
                                //controller: controller.workController,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    25.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_drink_outlined,
                                    size: 20,
                                    color: MyThemeData.light.focusColor,
                                  ).paddingSymmetric(horizontal: 7),
                                  
                                  Text(
                                    'Drinks section'.tr,
                                    style: TajawalRegular.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                height: 45,
                                radius: 20,
                                hintText: 'Drinks section'.tr,
                                inputType: TextInputType.text,
                                //controller: controller.workController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              const SizedBox(height: 5),
                              CustomTextField(
                                height: 45,
                                radius: 20,
                                hintText: 'Address'.tr,
                                inputType: TextInputType.text,
                                //controller: controller.workController,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    45.verticalSpace,
                    Row(
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
    );
  }
}
