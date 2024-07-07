import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';


class DealMeals extends StatefulWidget {
  const DealMeals({super.key});

  @override
  DealMealsState createState() => DealMealsState();
}

class DealMealsState extends State<DealMeals> {
  int? selectedIndex;
  final MealsController mealsController = Get.find<MealsController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final DealsController dealsController = Get.find<DealsController>();
  @override
  void initState() {
    dealsController.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     await mealsController.getMeals(context);
    });
    mealsController.getMeals(context);
    super.initState();
  }
  DealMealsModel? selectedMeal;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DealsController>(
      builder: (dealsController) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Images.food,
                          height: 20,
                          width: 20,
                          color: MyThemeData.light.focusColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Meals'.tr,
                          style: TajawalBold.copyWith(
                            fontSize: 14,
                            color: MyThemeData.light.focusColor,
                          ),
                        ).paddingOnly(top: 5),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 180,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 2.7,
                        ),
                        itemCount: mealsController.mealsList.length,
                        itemBuilder: (context, index) {
                          final meal = mealsController.mealsList[index];
                          final isSelected = dealsController.selectedMealsList
                              .any((element) => element.mealId == meal.id);
                          return OnHover(
                            onTap: () {
                              selectedMeal = DealMealsModel(
                                mealId: meal.id,
                                price: 0,
                              );
                              if (isSelected) {
                                dealsController.selectedMealsList.removeWhere(
                                    (element) => element.mealId == meal.id);
                              } else {
                                dealsController.selectedMealsList
                                    .add(selectedMeal!);
                              }
                              setState(() {
                                print(selectedMeal?.toJson());
                                print(dealsController.selectedMealsList.toJson());
                              });
                            },
                            matrix: 0,
                            builder: (isHovered) {
                              final color = isHovered
                                  ? MyThemeData.light.highlightColor
                                  : Colors.black.withOpacity(0.20);
                              return Container(
                                padding: const EdgeInsets.only(
                                  left: 5,
                                  right: 10,
                                  bottom: 5,
                                  top: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: isSelected
                                        ? MyThemeData.light.primaryColor
                                        : color,
                                    width: isSelected ? 2.5 : 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: isSelected
                                      ? MainAxisAlignment.center
                                      : MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: SizedBox(
                                            height: 36,
                                            width: 36,
                                            child: Image.network(
                                              meal.primaryImage,
                                              fit: BoxFit.fill,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        3.horizontalSpace,
                                        SizedBox(
                                          width: 35,
                                          child: Text(
                                            languageController.langLocal == ara
                                                ? meal.name.ar.capitalize ?? ""
                                                : languageController
                                                            .langLocal ==
                                                        eng
                                                    ? meal.name.en.capitalize ??
                                                        ""
                                                    : meal.name.he.capitalize ??
                                                        "",
                                            overflow: TextOverflow.ellipsis,
                                            style: TajawalRegular.copyWith(
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    5.horizontalSpace,
                                    isSelected
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Price'.tr,
                                                style: TajawalRegular.copyWith(
                                                  fontSize: 12,
                                                ),
                                              ).paddingSymmetric(vertical: 3),
                                              SizedBox(
                                                width: 60,
                                                child: CustomTextField(
                                                  height: 30,
                                                  radius: 5,
                                                  inputType: TextInputType.phone,
                                                  onChanged: (value) {
                                                    final mealIndex = dealsController.
                                                    selectedMealsList.indexWhere((meals) =>
                                                    meal.id == meals.mealId);
                                                    if (mealIndex != -1) {
                                                      dealsController.selectedMealsList[mealIndex].
                                                      price = int.tryParse(value) ?? 0;
                                                    }
                                                    print(selectedMeal?.toJson());
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
