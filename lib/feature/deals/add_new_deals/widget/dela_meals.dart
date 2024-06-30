import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field.dart';

class DealMeals extends StatefulWidget {
  const DealMeals({super.key});

  @override
  _DealMealsState createState() => _DealMealsState();
}

class _DealMealsState extends State<DealMeals> {
  int? selectedIndex;
  List<bool> isYesSelectedList = List<bool>.generate(5, (index) => true);

  @override
  Widget build(BuildContext context) {
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
                      childAspectRatio: 1.4,
                    ),
                    itemCount: isYesSelectedList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedIndex == index) {
                              selectedIndex = null;
                            } else {
                              selectedIndex = index;
                            }
                          });
                        },
                        child: selectedIndex == index ? selectedMeal(index) : notSelectedMeal(),
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
  }

  Widget selectedMeal(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: MyThemeData.light.primaryColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: Image.asset(
                      Images.background,
                      height: 36,
                      width: 36,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'meal name'.tr,
                  style: TajawalRegular.copyWith(
                    fontSize: 14,
                  ),
                ).paddingOnly(top: 5),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price'.tr,
                      style: TajawalRegular.copyWith(
                        fontSize: 12,
                      ),
                    ).paddingSymmetric(vertical: 3),
                    const SizedBox(
                      width: 60,
                      child: CustomTextField(
                        height: 30,
                        radius: 5,
                        inputType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget notSelectedMeal() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 36,
            height: 36,
            child: Image.asset(
              Images.background,
              height: 36,
              width: 36,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'meal name'.tr,
          style: TajawalRegular.copyWith(
            fontSize: 14,
          ),
        ).paddingOnly(top: 5),
      ],
    );
  }
}
