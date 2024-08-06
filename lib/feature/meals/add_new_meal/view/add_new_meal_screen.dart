import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/feature/meals/model/meals_model.dart';

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
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.height * 1 / 1.6,
                        decoration: BoxDecoration(
                          color: const Color(0xff2D2D2D),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 14,
                              spreadRadius: 9,
                            ),
                          ],
                        ),
                        child: MealsPhotosWidget(
                          meals: widget.meals,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const ComponentSelect(),
                  const SizedBox(height: 15),
                  const AttributesSelect(),
                  const SizedBox(height: 15),
                  Center(
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
                        mealsController.createMeals(context);
                      },
                    ),
                  ),
                  // Obx(() {
                  //   switch (mealsController.controllerState.value) {
                  //     case ControllerState.loading:
                  //       return Center(
                  //         child: CircularProgressIndicator(
                  //             color: MyThemeData.light.primaryColor),
                  //       );
                  //     case ControllerState.error:
                  //       return Center(
                  //         child: CustomButton(
                  //           buttonText: widget.isEdit == true ? 'edit'.tr : 'save'.tr,
                  //           icon: SvgPicture.asset(Images.correct)
                  //               .paddingSymmetric(horizontal: 4),
                  //           style: TajawalBold.copyWith(
                  //             color: Colors.white,
                  //           ),
                  //           radius: 20,
                  //           width: 160,
                  //           height: 45,
                  //           backGroundColor: MyThemeData.light.primaryColor,
                  //           onPressed: () {
                  //             if (widget.isEdit == true) {
                  //               mealsController.updateMeals(
                  //                   context, widget.meals!.id);
                  //             } else {
                  //               mealsController.createMeals(context);
                  //             }
                  //           },
                  //         ),
                  //       );
                  //     default:
                  //       return Center(
                  //         child: CustomButton(
                  //           buttonText:
                  //           widget.isEdit == true ? 'edit'.tr : 'save'.tr,
                  //           icon: SvgPicture.asset(Images.correct)
                  //               .paddingSymmetric(horizontal: 4),
                  //           style: TajawalBold.copyWith(
                  //             color: Colors.white,
                  //           ),
                  //           radius: 20,
                  //           width: 160,
                  //           height: 45,
                  //           backGroundColor: MyThemeData.light.primaryColor,
                  //           onPressed: () {
                  //             if (widget.isEdit == true) {
                  //               mealsController.updateMeals(
                  //                   context, widget.meals!.id);
                  //             } else {
                  //               mealsController.createMeals(context);
                  //             }
                  //           },
                  //         ),
                  //       );
                  //   }
                  // }),
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
// if (isSelected)
//   Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'Default'.tr,
//         style: TajawalBold.copyWith(
//           fontSize: 12,
//         ),
//       ),
//       const SizedBox(height: 3),
//       Row(
//         mainAxisAlignment:
//         MainAxisAlignment.start,
//         crossAxisAlignment:
//         CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedAttribute.isCheck = 1;
//                 print(
//                     selectedAttributes?.toJson());
//               });
//             },
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 8,
//                   backgroundColor:
//                   selectedAttribute.isCheck ==
//                       1
//                       ? MyThemeData
//                       .light.primaryColor
//                       : MyThemeData
//                       .light.hoverColor,
//                   child: selectedAttribute
//                       .isCheck ==
//                       1
//                       ? const Center(
//                     child: Icon(
//                       Icons.check,
//                       color: Colors.white,
//                       size: 13,
//                     ),
//                   )
//                       : null,
//                 ),
//                 const SizedBox(width: 4),
//                 Text(
//                   'yes'.tr,
//                   style: TajawalRegular.copyWith(
//                     fontSize: 14,
//                   ),
//                 ).paddingOnly(top: 5),
//               ],
//             ),
//           ),
//           15.horizontalSpace,
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedAttribute.isCheck = 0;
//                 print(
//                     selectedAttributes?.toJson());
//               });
//             },
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 8,
//                   backgroundColor:
//                   selectedAttribute.isCheck ==
//                       0
//                       ? MyThemeData
//                       .light.primaryColor
//                       : MyThemeData
//                       .light.hoverColor,
//                   child: selectedAttribute
//                       .isCheck ==
//                       0
//                       ? const Center(
//                     child: Icon(
//                       Icons.check,
//                       color: Colors.white,
//                       size: 13,
//                     ),
//                   )
//                       : null,
//                 ),
//                 const SizedBox(width: 4),
//                 Text(
//                   'no'.tr,
//                   style: TajawalRegular.copyWith(
//                     fontSize: 14,
//                   ),
//                 ).paddingOnly(top: 5),
//               ],
//             ),
//           ),
//         ],
//       ),
//       if (selectedAttribute.isCheck == 0)
//         Column(
//           crossAxisAlignment:
//           CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Price'.tr,
//               style: TajawalRegular.copyWith(
//                 fontSize: 12,
//               ),
//             ).paddingSymmetric(vertical: 3),
//             SizedBox(
//               width: 60,
//               child: CustomTextField(
//                 height: 30,
//                 radius: 5,
//                 inputType: TextInputType.phone,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedAttribute.price = int.tryParse(value) ?? 0;
//                     print(selectedAttributes?.toJson());
//                   });
//                 },
//               ),
//             ),
//           ],
//         ).paddingOnly(
//           right: languageController.langLocal == eng
//               ? 0
//               : 90,
//           left: languageController.langLocal == eng
//               ? 90
//               : 0,
//         ),
//     ],
//   ),