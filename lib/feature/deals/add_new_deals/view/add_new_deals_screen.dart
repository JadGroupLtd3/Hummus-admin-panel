import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/deals/add_new_deals/widget/deals_nav_bar.dart';
import 'package:hummus_admin_panel/feature/deals/add_new_deals/widget/deals_texts_field.dart';
import 'package:hummus_admin_panel/feature/deals/add_new_deals/widget/dela_meals.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/add_photo_widget.dart';
import 'package:hummus_admin_panel/widgets/custom_button.dart';


class AddNewDealsScreen extends StatelessWidget {
  AddNewDealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${'Home'.tr} / ${'Deals'.tr} / ${'Add New'.tr}',
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<SliderPagesController>(
                    builder: (sliderPagesController) {
                      return Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 14,
                                spreadRadius: 9,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              DealsNavBar(
                                sliderPagesController: sliderPagesController,
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    1 /
                                    1.77,
                                child: PageView(
                                  onPageChanged: sliderPagesController.animateToDealsNameTab,
                                  controller: sliderPagesController.dealPageController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  children: [...sliderPagesController.dealNamesPages],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: MediaQuery.of(context).size.height * 1 / 2.5,
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
                      child: Center(child: AddPhotoWidget()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              DealsTextsField(),
              const SizedBox(height: 20),
              DealMeals(),
              const SizedBox(height: 10),
              Center(
                child: CustomButton(
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
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
