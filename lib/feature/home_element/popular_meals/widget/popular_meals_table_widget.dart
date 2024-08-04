import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class PopularMealsTableWidget extends StatefulWidget {
  const PopularMealsTableWidget({super.key});

  @override
  State<PopularMealsTableWidget> createState() => _PopularMealsTableWidgetState();
}

class _PopularMealsTableWidgetState extends State<PopularMealsTableWidget> {
  final LanguageController languageController = Get.find<LanguageController>();
  final PopularMealsController popularMealsController = Get.find<PopularMealsController>();
  final int itemsPerPage = 6;
  int currentPage = 0;
  @override
  void initState() {
    popularMealsController.getPopularMeals(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularMealsController>(
      builder: (popularMealsController) {
        return Column(
          children: [
            Table(
              columnWidths: const {
                1: IntrinsicColumnWidth(),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: MyThemeData.light.focusColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  children: [
                    const TextUtils(title: '#', color: Colors.white)
                        .paddingOnly(
                            right: languageController.langLocal == eng ? 0 : 20,
                            left: languageController.langLocal == eng ? 20 : 0),
                    TextUtils(title: 'Image'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 0 : 30,
                            right:
                                languageController.langLocal == eng ? 30 : 0),
                    TextUtils(title: 'Meal name'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 40 : 0,
                            right:
                                languageController.langLocal == eng ? 0 : 40),
                    Center(
                        child: TextUtils(
                            title: 'Actual price'.tr, color: Colors.white)),
                    Center(
                        child: TextUtils(
                            title: 'Fake price'.tr, color: Colors.white)),
                    Center(
                        child: TextUtils(
                            title: 'Section'.tr, color: Colors.white)),
                    TextUtils(
                        title: 'Activation status'.tr, color: Colors.white),
                    TextUtils(title: 'Operations'.tr, color: Colors.white)
                        .paddingOnly(
                            left: languageController.langLocal == eng ? 20 : 0,
                            right:
                                languageController.langLocal == eng ? 0 : 20),
                  ],
                ),
              ],
            ),
            Obx(
                  () {
                if (popularMealsController.controllerState.value == ControllerState.loading) {
                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      Center(
                        child: CircularProgressIndicator(
                          color: MyThemeData.light.primaryColor,
                        ),
                      ),
                    ],
                  );
                } else {
                  final int totalPages = (popularMealsController.popularMealsList.length / itemsPerPage).ceil();
                  final currentPageItems = popularMealsController.popularMealsList.skip(currentPage * itemsPerPage).take(itemsPerPage).toList();
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: currentPageItems.length,
                            itemBuilder: (context, index) {
                              final popular = currentPageItems[index];
                              return Table(
                                columnWidths: const {
                                  1: IntrinsicColumnWidth(),
                                },
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            color: Colors.black.withOpacity(0.1)),
                                        bottom: BorderSide(
                                            color: Colors.black.withOpacity(0.1)),
                                      ),
                                    ),
                                    children: [
                                      const TextUtils(title: '#').paddingOnly(
                                          right:
                                          languageController.langLocal == eng ? 0 : 20,
                                          left:
                                          languageController.langLocal == eng ? 20 : 0,
                                          top: 10,
                                          bottom: 10),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: SizedBox(
                                          width: 36,
                                          height: 36,
                                          child: Image.network(
                                            popular.primaryImage,
                                            height: 36,
                                            width: 36,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ).paddingOnly(
                                          left:
                                          languageController.langLocal == eng ? 0 : 30,
                                          right:
                                          languageController.langLocal == eng ? 30 : 0,
                                          top: 10,
                                          bottom: 10),
                                      TextUtils(title:
                                      languageController.langLocal == eng
                                          ? popular.name.en
                                          : languageController.langLocal == ara
                                          ? popular.name.ar
                                          : popular.name.he,
                                      ).paddingOnly(
                                          left:
                                          languageController.langLocal == eng ? 40 : 0,
                                          right:
                                          languageController.langLocal == eng ? 0 : 40,
                                          top: 10,
                                          bottom: 10),
                                      Center(
                                          child: TextUtils(title: popular.totalPrice)
                                              .paddingOnly(top: 10, bottom: 10)),
                                      Center(
                                          child: TextUtils(title: popular.fakePrice)
                                              .paddingOnly(top: 10, bottom: 10)),
                                      Center(
                                          child: TextUtils(title:
                                          languageController.langLocal == eng
                                              ? popular.category.name.en
                                              : languageController.langLocal == ara
                                              ? popular.category.name.ar
                                              : popular.category.name.he,
                                          )
                                              .paddingOnly(top: 10, bottom: 10)),
                                      Center(
                                        child: SvgPicture.asset(
                                          Images.dot,
                                          width: 25,
                                          height: 25,
                                        ).paddingOnly(
                                            left: languageController.langLocal == eng
                                                ? 0
                                                : 18,
                                            right: languageController.langLocal == eng
                                                ? 18
                                                : 0,
                                            top: 10,
                                            bottom: 10),
                                      ),
                                      OnHover(
                                        matrix: 0,
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ConfirmationDialog(
                                                backgroundColor: Colors.white,
                                                padding: 5,
                                                icon: Images.delete,
                                                color: Colors.black,
                                                description: 'Do you want to delete this popular meal?'.tr,
                                                title: 'Delete Popular Meal'.tr,
                                                onYesPressed: () {
                                                  popularMealsController.deletePopularMeals(
                                                    context,
                                                    popularMealID: popular.id,
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        builder: (isHovered) {
                                          return SvgPicture.asset(
                                            Images.delete,
                                            width: 30,
                                            height: 30,
                                          );
                                        },
                                      ).paddingOnly(
                                          left:
                                          languageController.langLocal == eng ? 0 : 15,
                                          right:
                                          languageController.langLocal == eng ? 15 : 0,
                                          top: 10,
                                          bottom: 10),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: currentPage > 0
                                  ? () {
                                setState(() {
                                  currentPage--;
                                });
                              }
                                  : null,
                              child: Text('Previous'.tr).paddingOnly(top: 6),
                            ),
                            5.horizontalSpace,
                            Row(
                              children: List.generate(totalPages, (index) {
                                return OnHover(
                                  matrix: 0,
                                  onTap: () {
                                    setState(() {
                                      currentPage = index;
                                    });
                                  },
                                  builder: (isHovered) {
                                    return Container(
                                      height: 31,
                                      width: 31,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                        color: currentPage == index
                                            ? MyThemeData.light.primaryColor
                                            : const Color(0xff2B2969)
                                            .withOpacity(.10),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            color: currentPage == index
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                            ),
                            5.horizontalSpace,
                            TextButton(
                              onPressed: currentPage < totalPages - 1
                                  ? () {
                                setState(() {
                                  currentPage++;
                                });
                              }
                                  : null,
                              child: Text('Next'.tr).paddingOnly(top: 6),
                            ),
                          ],
                        ).paddingAll(10),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
