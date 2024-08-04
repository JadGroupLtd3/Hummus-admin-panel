import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/meals/show_meals/widget/recommended_meal_section.dart';

class ShowMealsScreen extends StatelessWidget {
  const ShowMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<MealsController>().getRecommendedMeals(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<MealsController>(
            builder: (mealsController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${'Home'.tr} / ${'Meals'.tr} / ${'Show meals'.tr}',
                        style: TajawalRegular.copyWith(
                          fontSize: 16,
                        ),
                      ).paddingSymmetric(horizontal: 7),
                      OnHover(
                        builder: (isHovered) {
                          return CustomButton(
                            buttonText: 'Add New'.tr,
                            backGroundColor: MyThemeData.light.focusColor,
                            radius: 7,
                            width: 150,
                            height: 45,
                            onPressed: () {
                              Get.find<SliderPagesController>().goToTab(29);
                            },
                          ).paddingSymmetric(horizontal: 7);
                        },
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  RecommendedMealSection(),
                  12.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
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
                          child: const MealsTableWidget(),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
