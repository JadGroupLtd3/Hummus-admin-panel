import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/meals/model/meals_model.dart';
import 'package:hummus_admin_panel/feature/meals/widget/related_meals_widget.dart';

class AddNewMealScreen extends StatefulWidget {
  final bool isEdit;
  final Meals? meals;

  const AddNewMealScreen({super.key, this.isEdit = false, this.meals});

  @override
  State<AddNewMealScreen> createState() => _AddNewMealScreenState();
}

class _AddNewMealScreenState extends State<AddNewMealScreen> {
  final MealsController mealsController = Get.find<MealsController>();

  @override
  void initState() {
    mealsController.initState();
    if (widget.isEdit == true) {
      mealsController.isEdit(widget.meals!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: GetBuilder<MealsController>(
            builder: (mealsController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isEdit == true
                        ? '${'Home'.tr} / ${'Meals'.tr} / ${'Edit meal'.tr}'
                        : '${'Home'.tr} / ${'Meals'.tr} / ${'Add New'.tr}',
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
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.height * 1 / 1.46,
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
                                Container(
                                  height: MediaQuery.of(context).size.height * 1 / 2.1,
                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 0),
                                        color: Colors.black.withOpacity(0.02),
                                        blurRadius: 14,
                                        spreadRadius: 9,
                                      ),
                                    ]
                                  ),
                                  child: Column(
                                    children: [
                                      MealsNavBar(
                                        sliderPagesController: sliderPagesController,
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 1 / 2.9,
                                        child: PageView(
                                          onPageChanged: sliderPagesController.animateToMealsNameTab,
                                          controller: sliderPagesController.mealPageController,
                                          physics: const NeverScrollableScrollPhysics(),
                                          clipBehavior: Clip.none,
                                          children: [...sliderPagesController.mealNamesPages],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const ElementAndHashtagSelect(),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                                  width: MediaQuery.of(context).size.height * 1 / 1.46,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 0),
                                          color: Colors.black.withOpacity(0.02),
                                          blurRadius: 14,
                                          spreadRadius: 9,
                                        ),
                                      ]
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.monetization_on_outlined,
                                            size: 22,
                                            color: MyThemeData.light.focusColor,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Coins points'.tr,
                                            style: TajawalBold.copyWith(
                                              fontSize: 14,
                                              color: MyThemeData.light.focusColor,
                                            ),
                                          ).paddingOnly(top: 5),
                                        ],
                                      ),
                                      15.verticalSpace,
                                      CustomTextField(
                                        height: 45,
                                        radius: 20,
                                        hintText: 'Coins points'.tr,
                                        inputType: TextInputType.phone,
                                        controller: mealsController.coinPoints,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 15),
                      MealsPhotosWidget(
                        meals: widget.meals,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const ComponentSelect(),
                  const SizedBox(height: 15),
                  const AttributesSelect(),
                  const SizedBox(height: 15),
                  const RelatedMealsWidget(),
                  const SizedBox(height: 15),
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
                            buttonText: widget.isEdit == true ? 'edit'.tr : 'save'.tr,
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
                              if (widget.isEdit == true) {
                                mealsController.updateMeals(
                                    context, widget.meals!.id);
                              } else {
                                mealsController.createMeals(context);
                              }
                            },
                          ),
                        );
                      default:
                        return Center(
                          child: CustomButton(
                            buttonText:
                            widget.isEdit == true ? 'edit'.tr : 'save'.tr,
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
                              if (widget.isEdit == true) {
                                mealsController.updateMeals(
                                    context, widget.meals!.id);
                              } else {
                                mealsController.createMeals(context);
                              }
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