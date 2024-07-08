import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddNewMealScreen extends StatelessWidget {
  const AddNewMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: GetBuilder<MealsController>(
            initState: (state) {
              Get.find<MealsController>().initState();
              state.controller?.initState();
            },
            builder: (mealsController) {
              return Column(
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
                  Obx(() {
                    switch (mealsController.controllerState.value) {
                      case ControllerState.loading:
                        return Center(
                          child: CircularProgressIndicator(
                              color: MyThemeData.light.primaryColor),
                        );
                      case ControllerState.error:
                        return Center(
                          child: CustomButton(
                            buttonText: 'save'.tr,
                            icon: SvgPicture.asset(Images.correct)
                                .paddingSymmetric(horizontal: 4),
                            style: TajawalBold.copyWith(
                              color: Colors.white,
                            ),
                            radius: 20,
                            width: 160,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: () {
                              mealsController.createMeals(context);
                            },
                          ),
                        );
                      default:
                        return Center(
                          child: CustomButton(
                            buttonText: 'save'.tr,
                            icon: SvgPicture.asset(Images.correct)
                                .paddingSymmetric(horizontal: 4),
                            style: TajawalBold.copyWith(
                              color: Colors.white,
                            ),
                            radius: 20,
                            width: 160,
                            height: 45,
                            backGroundColor: MyThemeData.light.primaryColor,
                            onPressed: () {
                              mealsController.createMeals(context);
                            },
                          ),
                        );
                    }
                  }),
                  const SizedBox(height: 50),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
