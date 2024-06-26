import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/feature/meals/widget/attributes_select.dart';
import 'package:hummus_admin_panel/feature/meals/widget/component_select.dart';
import 'package:hummus_admin_panel/feature/meals/widget/element_and_hashtag_select.dart';
import 'package:hummus_admin_panel/feature/meals/widget/meals_nav_bar.dart';
import 'package:hummus_admin_panel/feature/meals/widget/meals_photos_widget.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_button.dart';

class AddNewMealScreen extends StatelessWidget {
  const AddNewMealScreen({super.key});

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
                '${'Home'.tr} / ${'Meals'.tr} / ${'Add New'.tr}',
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
                              MealsNavBar(
                                sliderPagesController: sliderPagesController,
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 1 / 1.77,
                                child: PageView(
                                  onPageChanged: sliderPagesController.animateToMealsNameTab,
                                  controller: sliderPagesController.mealPageController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.none,
                                  children: [...sliderPagesController.mealNamesPages],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const ElementAndHashtagSelect(),
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
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xff2D2D2D),
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
                      child: const MealsPhotosWidget(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const ComponentSelect(),
              const SizedBox(height: 20),
              const AttributesSelect(),
              const SizedBox(height: 30),
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
