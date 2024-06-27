import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_button.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';

class QuestionsAndAnswersScreen extends StatelessWidget {
  const QuestionsAndAnswersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${'Home'.tr} / ${'Questions'.tr} / ${'Show Questions'.tr}',
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OnHover(
                    builder: (isHovered) {
                      return CustomButton(
                        buttonText: 'Add Questions'.tr,
                        icon: SvgPicture.asset(Images.correct),
                        backGroundColor: MyThemeData.light.focusColor,
                        radius: 7,
                        width: 150,
                        height: 45,
                        onPressed: (){},
                      );
                    },
                  ),
                  3.horizontalSpace,
                ],
              ),
              12.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      height: MediaQuery.of(context).size.height * 1 / 1.43,
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
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                                    margin: const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(500),
                                      border: Border.all(color: Colors.black.withOpacity(.08)),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 0),
                                          color: Colors.black.withOpacity(.02),
                                          blurRadius: 14,
                                          spreadRadius: 9,
                                        )
                                      ]
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Show Questions Show Questions Show Questions',
                                          style: TajawalRegular.copyWith(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            OnHover(
                                              matrix: 0,
                                              builder: (isHovered) {
                                                return SvgPicture.asset(
                                                  Images.edit,
                                                  width: 30,
                                                  height: 30,
                                                );
                                              },),
                                            5.horizontalSpace,
                                            OnHover(
                                              matrix: 0,
                                              builder: (isHovered) {
                                                return SvgPicture.asset(
                                                  Images.delete,
                                                  width: 30,
                                                  height: 30,
                                                );
                                              },),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
