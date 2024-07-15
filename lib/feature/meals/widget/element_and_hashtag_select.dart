import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class ElementAndHashtagSelect extends StatefulWidget {
  const ElementAndHashtagSelect({super.key});

  @override
  ElementAndHashtagSelectState createState() => ElementAndHashtagSelectState();
}

class ElementAndHashtagSelectState extends State<ElementAndHashtagSelect> {
  final HashtagController hashtagController = Get.find<HashtagController>();
  final LanguageController languageController = Get.find<LanguageController>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (mealsController) {
        return Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Images.Elements,
                      height: 20,
                      width: 20,
                      color: MyThemeData.light.focusColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Appearing in the home page'.tr,
                      style: TajawalBold.copyWith(
                        fontSize: 14,
                        color: MyThemeData.light.focusColor,
                      ),
                    ).paddingOnly(top: 5),
                  ],
                ),
                const SizedBox(height: 15),
                Obx(() {
                  switch (mealsController.controllerState.value) {
                    case ControllerState.loading:
                      return const Center(
                        child: SizedBox(height: 120,),
                      );
                    default:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          5.5.horizontalSpace,
                          OnHover(
                            matrix: 0,
                            builder: (isHovered) {
                              final isSelected = mealsController.selectedHomeCategoriesList
                                  .any((element) => element.type == 'feature');
                              return GestureDetector(
                                onTap: (){
                                  CreateHomeCategories selectedCategories = CreateHomeCategories(
                                    type: 'feature',
                                  );
                                  if (isSelected) {
                                    mealsController.selectedHomeCategoriesList.removeWhere(
                                            (element) => element.type == 'feature');
                                  } else {
                                    mealsController.selectedHomeCategoriesList
                                        .add(selectedCategories);
                                  }
                                  setState(() {
                                    print(selectedCategories.toJson());
                                    print(mealsController.selectedHomeCategoriesList.toJson());
                                  });
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: isSelected
                                          ? MyThemeData.light.primaryColor
                                          : MyThemeData.light.hoverColor,
                                      child: isSelected
                                          ? const Center(
                                          child: Icon(Icons.check,
                                              color: Colors.white, size: 13))
                                          : null,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Featured Meals'.tr,
                                      style: TajawalRegular.copyWith(
                                        fontSize: 14,
                                      ),
                                    ).paddingOnly(top: 5),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 50),
                          OnHover(
                            matrix: 0,
                            builder: (isHovered) {
                              final isSelected = mealsController.selectedHomeCategoriesList
                                  .any((element) => element.type == 'popular');
                              return GestureDetector(
                                onTap: (){
                                  CreateHomeCategories selectedCategories = CreateHomeCategories(
                                    type: 'popular',
                                  );
                                  if (isSelected) {
                                    mealsController.selectedHomeCategoriesList.removeWhere(
                                            (element) => element.type == 'popular');
                                  } else {
                                    mealsController.selectedHomeCategoriesList
                                        .add(selectedCategories);
                                  }
                                  setState(() {
                                    print(selectedCategories.toJson());
                                    print(mealsController.selectedHomeCategoriesList.toJson());
                                  });
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: isSelected
                                          ? MyThemeData.light.primaryColor
                                          : MyThemeData.light.hoverColor,
                                      child: isSelected
                                          ? const Center(
                                          child: Icon(Icons.check,
                                              color: Colors.white, size: 13))
                                          : null,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Popular Meals'.tr,
                                      style: TajawalRegular.copyWith(
                                        fontSize: 14,
                                      ),
                                    ).paddingOnly(top: 5),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      );
                  }
                }),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Images.hashtag,
                      height: 20,
                      width: 20,
                      color: MyThemeData.light.focusColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Hashtags'.tr,
                      style: TajawalBold.copyWith(
                        fontSize: 14,
                        color: MyThemeData.light.focusColor,
                      ),
                    ).paddingOnly(top: 5),
                  ],
                ),
                const SizedBox(height: 15),
                Obx(() {
                  switch (mealsController.controllerState.value) {
                    case ControllerState.loading:
                      return const Center(
                        child: SizedBox(height: 120,),
                      );
                    default:
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 180,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 2.7,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: hashtagController.hashtagList.length,
                        itemBuilder: (context, index) {
                          final hashtag = hashtagController.hashtagList[index];
                          final isSelected = mealsController.selectedHashtagsList
                              .any((element) => element.hashtagId == hashtag.id);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                            child: OnHover(
                              onTap: () {
                                CreateHashtags selectedHashtag = CreateHashtags(
                                    hashtagId: hashtag.id!
                                );
                                if (isSelected) {
                                  mealsController.selectedHashtagsList.removeWhere(
                                          (element) => element.hashtagId == hashtag.id);
                                } else {
                                  mealsController.selectedHashtagsList
                                      .add(selectedHashtag);
                                }
                                setState(() {
                                  print(selectedHashtag.toJson());
                                  print(mealsController.selectedHashtagsList.toJson());
                                });
                              },
                              matrix: 0,
                              builder: (isHovered) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: isSelected
                                          ? MyThemeData.light.primaryColor
                                          : MyThemeData.light.hoverColor,
                                      child: isSelected
                                          ? const Center(
                                          child: Icon(Icons.check,
                                              color: Colors.white, size: 13))
                                          : null,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      languageController.langLocal == eng
                                          ? hashtag.nameEn ?? ''
                                          : languageController.langLocal == ara
                                          ? hashtag.nameAr ?? ''
                                          : hashtag.nameHe ?? '',
                                      style: TajawalRegular.copyWith(
                                        fontSize: 14,
                                      ),
                                    ).paddingOnly(top: 5),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      );
                  }
                }),
              ],
            ),
          ],
        );
      },
    );
  }
}
