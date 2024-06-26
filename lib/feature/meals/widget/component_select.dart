import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field.dart';

class ComponentSelect extends StatefulWidget {
  const ComponentSelect({super.key});

  @override
  _ComponentSelectState createState() => _ComponentSelectState();
}

class _ComponentSelectState extends State<ComponentSelect> {
  int? selectedIndex;
  List<bool> isYesSelectedList = List<bool>.generate(5, (index) => true);

  double getItemHeight(int index) {
    if (index == selectedIndex) {
      return isYesSelectedList[index] ? 200 : 180;
    } else {
      return 100;
    }
  }

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
                      Images.category,
                      height: 20,
                      width: 20,
                      color: MyThemeData.light.focusColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Component'.tr,
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
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: isYesSelectedList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: SizedBox(
                          height: getItemHeight(index),
                          child: index == selectedIndex
                              ? selectedComponent(index)
                              : notSelectedComponent(),
                        ),
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

  Widget selectedComponent(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: MyThemeData.light.primaryColor,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -1),
            color: Colors.black.withOpacity(.07),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
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
                  'component name',
                  style: TajawalRegular.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Default'.tr,
                    style: TajawalBold.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isYesSelectedList[index] = true;
                          });
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: isYesSelectedList[index]
                                  ? MyThemeData.light.primaryColor
                                  : MyThemeData.light.hoverColor,
                              child: isYesSelectedList[index]
                                  ? const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 13,
                                ),
                              )
                                  : null,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'yes'.tr,
                              style: TajawalRegular.copyWith(
                                fontSize: 14,
                              ),
                            ).paddingOnly(top: 5),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isYesSelectedList[index] = false;
                          });
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: !isYesSelectedList[index]
                                  ? MyThemeData.light.primaryColor
                                  : MyThemeData.light.hoverColor,
                              child: !isYesSelectedList[index]
                                  ? const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 13,
                                ),
                              )
                                  : null,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'no'.tr,
                              style: TajawalRegular.copyWith(
                                fontSize: 14,
                              ),
                            ).paddingOnly(top: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (isYesSelectedList[index] == false)
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
                        )
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    ).paddingOnly(top: 28);
  }

  Widget notSelectedComponent() {
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
          'Component name'.tr,
          style: TajawalRegular.copyWith(
            fontSize: 14,
          ),
        ).paddingOnly(top: 5),
      ],
    );
  }
}





