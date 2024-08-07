import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class RelatedMealsWidget extends StatefulWidget {
  const RelatedMealsWidget({super.key});

  @override
  RelatedMealsWidgetState createState() => RelatedMealsWidgetState();
}

class RelatedMealsWidgetState extends State<RelatedMealsWidget> {
  int? selectedIndex;
  final MealsController mealsController = Get.find<MealsController>();
  final LanguageController languageController = Get.find<LanguageController>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     await mealsController.getMeals(context);
    });
    super.initState();
  }
  CreateRelatedProducts? selectedMeal;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (mealsController) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.height * 1 / 0.7,
          height: MediaQuery.of(context).size.height * 1 / 2.0,
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Related Meals'.tr,
                      style: TajawalBold.copyWith(
                        fontSize: 14,
                        color: MyThemeData.light.focusColor,
                      ),
                    ).paddingOnly(top: 5),
                  ],
                ),
                20.verticalSpace,
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 3.3,
                    ),
                    itemCount: mealsController.mealsList.length,
                    itemBuilder: (context, index) {
                      final meal = mealsController.mealsList[index];
                      final isSelected = mealsController.selectedRelatedProductsList
                          .any((element) => element.relatedProductId == meal.id);
                      return OnHover(
                        onTap: () {
                          selectedMeal = CreateRelatedProducts(
                            relatedProductId: meal.id,
                          );
                          if (isSelected) {
                            mealsController.selectedRelatedProductsList.removeWhere(
                                (element) => element.relatedProductId == meal.id);
                          } else {
                            mealsController.selectedRelatedProductsList.add(selectedMeal!);
                          }
                          setState(() {
                            print(selectedMeal?.toJson());
                            print(mealsController.selectedRelatedProductsList.toJson());
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                    2.horizontalSpace,
                                    SizedBox(
                                      width: 100,
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
          ),
        );
      },
    );
  }
}
