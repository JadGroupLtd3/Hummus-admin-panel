import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/meals/model/meals_model.dart';

class MealsPhotosWidget extends StatefulWidget {
  final Meals? meals;

  const MealsPhotosWidget({super.key, this.meals});

  @override
  State<MealsPhotosWidget> createState() => _MealsPhotosWidgetState();
}

class _MealsPhotosWidgetState extends State<MealsPhotosWidget> {
  final CategoryController categoryController = Get.find<CategoryController>();
  final LanguageController languageController = Get.find<LanguageController>();
  final MealsController mealsController = Get.find<MealsController>();
  String title = 'Category'.tr;

  @override
  void initState() {
    categoryController.getCategory(context);
    if (widget.meals != null) {
      setState(() {
        String selectedId =
            categoryController.categorySelectedId.value.toString();
        title = languageController.langLocal == eng
            ? categoryController.categoryList.firstWhere(
                (element) => element.id.toString() == selectedId).nameEn ?? ''
            : languageController.langLocal == ara
                ? categoryController.categoryList.firstWhere(
                            (element) => element.id.toString() == selectedId)
                        .nameAr ??
                    ''
                : categoryController.categoryList
                        .firstWhere(
                            (element) => element.id.toString() == selectedId)
                        .nameHe ??
                    '';
        print('new title $title');
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (mealsController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: MediaQuery.of(context).size.height * 1 / 4.0,
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
                child: Center(
                  child: AddPhotoWidget(
                    isMeal: true,
                    isEdit: widget.meals != null,
                    imagePath: mealsController.imagePath,
                    webImage: mealsController.webImage,
                    pickedImage: mealsController.pickedImage,
                    pickedProfileImageFile:
                        mealsController.pickedProfileImageFile,
                  ),
                ),
              ),
              // 10.verticalSpace,
              // Row(
              //   children: [
              //     Expanded(
              //       child: SizedBox(
              //         height: MediaQuery.of(context).size.height * 1 / 7.5,
              //         child: ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           itemCount: 2,
              //           itemBuilder: (context, index) {
              //             return Container(
              //               padding: const EdgeInsets.symmetric(
              //                   vertical: 10, horizontal: 10),
              //               margin: EdgeInsets.only(
              //                 right:
              //                     languageController.langLocal == eng ? 10 : 0,
              //                 left:
              //                     languageController.langLocal == eng ? 0 : 10,
              //               ),
              //               width: MediaQuery.of(context).size.height * 1 / 4.5,
              //               height:
              //                   MediaQuery.of(context).size.height * 1 / 7.5,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(15),
              //                 color: Colors.white,
              //                 boxShadow: [
              //                   BoxShadow(
              //                     offset: const Offset(0, 0),
              //                     color: Colors.black.withOpacity(0.02),
              //                     blurRadius: 14,
              //                     spreadRadius: 9,
              //                   )
              //                 ],
              //               ),
              //               child: Center(child: AddPhotoWidget()),
              //             );
              //           },
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              15.verticalSpace,
              Text(
                'Category'.tr,
                style: TajawalRegular.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ).paddingAll(5),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: DropDownBTN(
                  title: title,
                  onChanged: (String? val) {
                    setState(() {
                      if (val != null) {
                        title = languageController.langLocal == eng
                            ? categoryController.categoryList
                                    .firstWhere((element) =>
                                        element.id.toString() == val)
                                    .nameEn ??
                                ''
                            : languageController.langLocal == ara
                                ? categoryController.categoryList
                                        .firstWhere((element) =>
                                            element.id.toString() == val)
                                        .nameAr ??
                                    ''
                                : categoryController.categoryList
                                        .firstWhere((element) =>
                                            element.id.toString() == val)
                                        .nameHe ??
                                    '';
                      }
                    });
                    categoryController.categorySelectedId.value = int.parse(val ?? '');
                    print(categoryController.categorySelectedId.value);
                  },
                  items: categoryController.categoryList.map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val.id.toString(),
                        child: Text(
                          languageController.langLocal == eng
                              ? val.nameEn ?? ''
                              : languageController.langLocal == ara
                                  ? val.nameAr ?? ''
                                  : val.nameHe ?? '',
                          style: TajawalRegular.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              15.verticalSpace,
              Text(
                'Fake Price'.tr,
                style: TajawalRegular.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ).paddingAll(5),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: CustomTextField(
                  height: 45,
                  radius: 30,
                  hintText: 'Fake Price'.tr,
                  filled: false,
                  controller: mealsController.fakePrice,
                ),
              ),
              15.verticalSpace,
              Text(
                'Actual Price'.tr,
                style: TajawalRegular.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ).paddingAll(5),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: CustomTextField(
                  height: 45,
                  radius: 30,
                  hintText: 'Actual Price'.tr,
                  filled: false,
                  controller: mealsController.mealPrice,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
