import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';

class TabBTN extends StatelessWidget {
  final section;
  final page;
  final imagePath;
  final title;
  final widget;
  const TabBTN({super.key,this.widget,this.section,this.title,this.page,this.imagePath,});

  @override
  Widget build(BuildContext context) {
    final SliderPagesController sliderPagesController = Get.find<SliderPagesController>();
    return OnHover(
      matrix: 0,
      builder: (isHovered) {
        final hovered = Matrix4.identity()..translate(-5, 0, 0);
        final transform = isHovered ? hovered : Matrix4.identity();
        final color = isHovered
            ? MyThemeData.light.focusColor
            : MyThemeData.light.primaryColor;
        final textColor = isHovered
            ? MyThemeData.light.focusColor
            : const Color(0xffA8A8A8);
        return ExpandablePanel(
          collapsed: const SizedBox(),
          theme: const ExpandableThemeData(
            hasIcon: false,
            iconSize: 16,
          ),
          header: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: sliderPagesController.currentSection == section
                  ? MyThemeData.light.primaryColor
                  : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        imagePath,
                        color: sliderPagesController.currentSection == section
                            ? Colors.white
                            : color,
                        height: 22,
                        width: 22,
                      ),
                      4.horizontalSpace,
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        transform: transform,
                        child: Text(
                          title,
                          style: TajawalBold.copyWith(
                            fontSize: 14,
                            color: sliderPagesController.currentSection == section
                                ? Colors.white
                                : textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 15,
                    color: sliderPagesController.currentSection == section
                        ? Colors.white
                        : textColor,
                  ),
                ],
              ),
            ),
          ),
          expanded: widget ?? const SizedBox(),
        ).paddingSymmetric(vertical: 4);
      },
    );
  }
}

