import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class RecommendedMealSection extends StatelessWidget {
  const RecommendedMealSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (mealsController) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Meal".tr,
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
              5.verticalSpace,
              Container(
                width: MediaQuery.of(context).size.height * 1 / 1.8,
                height: MediaQuery.of(context).size.height * 1 / 3.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 14,
                      spreadRadius: 9,
                    ),
                  ],
                ),
                child: Obx(() {
                  return mealsController.controllerState.value ==
                          ControllerState.loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: MyThemeData.light.primaryColor,
                          ),
                        )
                      : mealsController.selectedMeal.value == null &&
                              mealsController.recommendedMealList.isEmpty
                          ? CustomButton(
                              backGroundColor: MyThemeData.light.primaryColor,
                              buttonText: 'Select Meal'.tr,
                              width: 120,
                              height: 49,
                              radius: 15,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Select Meal'.tr),
                                      content: DropDownBTN(
                                        title: 'Select Meal'.tr,
                                        items: mealsController.mealsList.map(
                                          (meal) {
                                            return DropdownMenuItem<String>(
                                              value: meal.name.ar,
                                              child: Text(meal.name.ar),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (val) {
                                          final meal = mealsController.mealsList
                                              .firstWhere(
                                                  (meal) => meal.name.ar == val);
                                          mealsController.createRecommendedMeals(
                                              context, meal.id);
                                          mealsController.selectMeal(meal);
                                          Get.back(); // Close the dialog
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          : Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Image.network(
                                    mealsController.recommendedMealList.last.primaryImage,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    Images.shadow,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 10,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mealsController
                                            .recommendedMealList.last.name.ar,
                                        style: TajawalBold.copyWith(
                                            fontSize: 24, color: Colors.white),
                                      ),
                                      Text(
                                        '${mealsController.recommendedMealList.last.totalPrice}₪',
                                        style: TajawalBold.copyWith(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                    ],
                                  ).paddingSymmetric(horizontal: 10),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: OnHover(
                                    matrix: 0,
                                    onTap: () {
                                      final selectedMeal =
                                          mealsController.recommendedMealList.last;
                                      mealsController.deleteRecommendedMeals(
                                        context,
                                        mealID: selectedMeal.id,
                                      );
                                      mealsController.clearSelectedMeal();
                                    },
                                    builder: (isHovered) {
                                      return const CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 12,
                                        child: Icon(Icons.close,
                                            size: 16, color: Colors.white),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
