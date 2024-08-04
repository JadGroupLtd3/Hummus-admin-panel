import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';


class CategoryTableWidget extends StatefulWidget {
  const CategoryTableWidget({super.key});

  @override
  State<CategoryTableWidget> createState() => _CategoryTableWidgetState();
}

class _CategoryTableWidgetState extends State<CategoryTableWidget> {
  final LanguageController languageController = Get.find<LanguageController>();
  final int itemsPerPage = 6;
  int currentPage = 0;
  @override
  void initState() {
    Get.find<CategoryController>().getCategory(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) {
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
                    TextUtils(title: 'Arabic Name'.tr, color: Colors.white)
                        .paddingOnly(
                        left: languageController.langLocal == eng ? 40 : 0,
                        right:
                        languageController.langLocal == eng ? 0 : 40),
                    Center(
                        child: TextUtils(
                            title: 'English Name'.tr, color: Colors.white)),
                    TextUtils(title: 'Hebrew Name'.tr, color: Colors.white),
                    TextUtils(
                        title: 'Activation status'.tr, color: Colors.white),
                    TextUtils(title: 'Operations'.tr, color: Colors.white)
                        .paddingOnly(
                        left: languageController.langLocal == eng ? 35 : 0,
                        right:
                        languageController.langLocal == eng ? 0 : 35),
                  ],
                ),
              ],
            ),
            Obx(
                  () {
                if (controller.controllerState.value ==
                    ControllerState.loading) {
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
                  final int totalPages = (controller.categoryList.length / itemsPerPage).ceil();
                  final currentPageItems = controller.categoryList.skip(currentPage * itemsPerPage).take(itemsPerPage).toList();
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: currentPageItems.length,
                            itemBuilder: (context, index) {
                              final category = currentPageItems[index];
                              return Table(
                                columnWidths: const {
                                  1: IntrinsicColumnWidth(),
                                },
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            color: Colors.black.withOpacity(
                                                0.1)),
                                        bottom: BorderSide(
                                            color: Colors.black.withOpacity(
                                                0.1)),
                                      ),
                                    ),
                                    children: [
                                      TextUtils(title: '${category.id}')
                                          .paddingOnly(
                                          right: languageController.langLocal ==
                                              eng
                                              ? 0
                                              : 20,
                                          left: languageController.langLocal ==
                                              eng
                                              ? 20
                                              : 0,
                                          top: 10,
                                          bottom: 10),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            100),
                                        child: SizedBox(
                                          width: 36,
                                          height: 36,
                                          child: Image.network(
                                            category.image ?? '',
                                            height: 36,
                                            width: 36,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ).paddingOnly(
                                          left: languageController.langLocal ==
                                              eng
                                              ? 0
                                              : 30,
                                          right: languageController.langLocal ==
                                              eng
                                              ? 30
                                              : 0,
                                          top: 10,
                                          bottom: 10),
                                      TextUtils(title: category.nameAr ?? '')
                                          .paddingOnly(
                                          left:
                                          languageController
                                              .langLocal ==
                                              eng
                                              ? 60
                                              : 0,
                                          right:
                                          languageController.langLocal == eng
                                              ? 0
                                              : 60,
                                          top: 10,
                                          bottom: 10),
                                      Center(
                                          child:
                                          TextUtils(
                                              title: category.nameEn ?? '')
                                              .paddingOnly(
                                              top: 10, bottom: 10)),
                                      TextUtils(title: category.nameHe ?? '')
                                          .paddingOnly(
                                          left:
                                          languageController
                                              .langLocal ==
                                              eng
                                              ? 20
                                              : 0,
                                          right:
                                          languageController.langLocal == eng
                                              ? 0
                                              : 20,
                                          top: 10,
                                          bottom: 10),
                                      Center(
                                        child: SvgPicture.asset(
                                          Images.dot,
                                          width: 25,
                                          height: 25,
                                          color: category.status == 1
                                              ? MyThemeData.light.primaryColor
                                              : Colors.red,
                                        ).paddingOnly(
                                            left: languageController
                                                .langLocal == eng
                                                ? 0
                                                : 18,
                                            right: languageController
                                                .langLocal == eng
                                                ? 18
                                                : 0,
                                            top: 10,
                                            bottom: 10),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          OnHover(
                                            matrix: 0,
                                            onTap: () {
                                              Get.to(() =>
                                                  AddNewCategoryScreen(
                                                    isEdit: true,
                                                    category: category,
                                                  ),
                                              );
                                            },
                                            builder: (isHovered) {
                                              return SvgPicture.asset(
                                                Images.edit,
                                                width: 30,
                                                height: 30,
                                              );
                                            },
                                          ),
                                          5.horizontalSpace,
                                          OnHover(
                                            matrix: 0,
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (
                                                    BuildContext context) {
                                                  return ConfirmationDialog(
                                                    backgroundColor: Colors
                                                        .white,
                                                    padding: 5,
                                                    icon: Images.delete,
                                                    color: Colors.black,
                                                    description:
                                                    'Do you want to delete this category?'
                                                        .tr,
                                                    title: 'Delete Category'.tr,
                                                    onYesPressed: () {
                                                      controller.deleteCategory(
                                                          context,
                                                          categoryID: category
                                                              .id!
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
                                          ),
                                        ],
                                      ).paddingOnly(
                                          left: languageController.langLocal ==
                                              eng
                                              ? 0
                                              : 15,
                                          right: languageController.langLocal ==
                                              eng
                                              ? 15
                                              : 0,
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
