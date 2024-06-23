import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';

class InformationWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final bool isBorder;
  const InformationWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    this.isBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffFAFAFA),
        border: Border.all(
          color: isBorder ? MyThemeData.light.primaryColor : Colors.transparent,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: Colors.black.withOpacity(0.09),
            blurRadius: 8,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(imagePath),
              5.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    subTitle,
                    style: TajawalLight.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
