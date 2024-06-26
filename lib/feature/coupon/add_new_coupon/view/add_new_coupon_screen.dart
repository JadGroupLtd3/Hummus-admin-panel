import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/coupon/add_new_coupon/widget/coupon_details_fields.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/add_new_product_fields.dart';
import 'package:hummus_admin_panel/widgets/custom_button.dart';

class AddNewCouponScreen extends StatelessWidget {
  AddNewCouponScreen({super.key});
  final GlobalKey<FormState> couponKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${'Home'.tr} / ${'Coupons'.tr} / ${'Add New'.tr}',
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
              12.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      height: MediaQuery.of(context).size.height * 1 / 2.21,
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
                      child: AddNewProductFields(isCoupon: true,fieldsKey: couponKey,),
                    ),
                  ),
                  7.horizontalSpace,
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: MediaQuery.of(context).size.height * 1 / 1.3999,
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
                      child: CouponDetailsFields(),
                    ),
                  ),
                ],
              ),
              30.verticalSpace,
              Center(
                child: CustomButton(
                  buttonText: 'save'.tr,
                  icon: SvgPicture.asset(Images.correct).paddingSymmetric(horizontal: 4),
                  style: TajawalBold.copyWith(
                    color: Colors.white,
                  ),
                  radius: 20,
                  width: 160,
                  height: 45,
                  backGroundColor: MyThemeData.light.primaryColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
