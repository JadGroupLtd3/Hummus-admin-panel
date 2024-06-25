import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';

class SubTabBTN extends StatefulWidget {
  final page;
  final imagePath;
  final title;
  const SubTabBTN({super.key,this.imagePath,this.page,this.title});

  @override
  State<SubTabBTN> createState() => _SubTabBTNState();
}

class _SubTabBTNState extends State<SubTabBTN> {
  @override
  Widget build(BuildContext context) {
    final SliderPagesController sliderPagesController = Get.find<SliderPagesController>();
    return OnHover(
      matrix: 0,
      onTap: () {
        setState(() {
          sliderPagesController.goToTab(widget.page);
        });
      },
      builder: (isHovered) {
        final hovered = Matrix4.identity()..translate(-5, 0, 0);
        final transform = isHovered ? hovered : Matrix4.identity();
        final color = isHovered
            ? MyThemeData.light.focusColor
            : MyThemeData.light.primaryColor;
        final textColor = isHovered
            ? MyThemeData.light.focusColor
            : const Color(0xffA8A8A8);
        return Row(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Row(
                children: [
                  5.horizontalSpace,
                  SvgPicture.asset(
                    Images.dot,
                    color: sliderPagesController.currentPage.value == widget.page
                        ? MyThemeData.light.focusColor
                        : color,
                    height: 8,
                    width: 8,
                  ),
                ],
              ),
            ),
            2.horizontalSpace,
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: transform,
              child: Text(
                widget.title,
                style: TajawalBold.copyWith(
                  fontSize: 13,
                  color: sliderPagesController.currentPage.value == widget.page
                      ? MyThemeData.light.focusColor
                      : textColor,
                ),
              ).paddingOnly(top: 4),
            ),
          ],
        ).paddingSymmetric(vertical: 4);
      },
    );
  }
}