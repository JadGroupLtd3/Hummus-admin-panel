import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/on_hover.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(0.02),
                blurRadius: 17,
                spreadRadius: 0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  statisticWidget(
                    context: context,
                    number: "0",
                    title: 'Orders Today'.tr,
                    page: 30,
                  ),
                  const SizedBox(width: 10),
                  statisticWidget(
                    context: context,
                    number: "0",
                    title: 'Orders'.tr,
                    page: 30,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  statisticWidget(
                    context: context,
                    number: "0",
                    title: 'Coupons'.tr,
                    page: 5,
                  ),
                  const SizedBox(width: 10),
                  statisticWidget(
                    context: context,
                    number: "0",
                    title: 'Meals'.tr,
                    page: 28,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statisticWidget({required BuildContext context,required final number,
    required final title,final page}){
    return OnHover(
      onTap: () {
        Get.find<SliderPagesController>().goToTab(page);
      },
      builder: (bool isHovered){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
          width: MediaQuery.of(context).size.width * 1 / 3.8,
          height: MediaQuery.of(context).size.height * 1 / 6.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: MyThemeData.light.focusColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              10.verticalSpace,
              Text(
                title,
                style: TajawalRegular.copyWith(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
