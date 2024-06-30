import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'order #144',
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    'since 4 days',
                    style: TajawalLight.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        Images.background,
                        height: 36,
                        width: 36,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  3.horizontalSpace,
                  Text(
                    'name',
                    style: TajawalRegular.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          30.verticalSpace,
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffFAFAFA),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Images.order_receive),
                      5.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          3.verticalSpace,
                          Text(
                            'pick up'.tr,
                            style: TajawalLight.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Images.money),
                      5.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Method'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          3.verticalSpace,
                          Text(
                            'COD'.tr,
                            style: TajawalLight.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Images.delivery_price),
                      5.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery price'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          3.verticalSpace,
                          Text(
                            '₪ 20'.tr,
                            style: TajawalLight.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          15.verticalSpace,
          Text(
            'Order item'.tr,
            style: TajawalBold.copyWith(
              fontSize: 14,
              color: MyThemeData.light.focusColor,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xffE4E4E4))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              Images.background,
                              height: 36,
                              width: 36,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        3.horizontalSpace,
                        Text(
                          'meal name',
                          style: TajawalRegular.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '₪ 20'.tr,
                      style: TajawalBold.copyWith(
                          fontSize: 16, color: MyThemeData.light.focusColor),
                    ),
                  ],
                ),
              );
            },
          ),
          Container(
            height: 2,
            color: const Color(0xffB0AAAA),
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total'.tr,
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                '₪ 60'.tr,
                style: TajawalBold.copyWith(
                  fontSize: 16,
                  color: MyThemeData.light.focusColor,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 10),
        ],
      ),
    );
  }
}
