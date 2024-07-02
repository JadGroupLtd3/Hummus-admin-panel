import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class AddNewCouponScreen extends StatelessWidget {
  AddNewCouponScreen({super.key});

  final GlobalKey<FormState> couponKey = GlobalKey<FormState>();
  final GlobalKey<FormState> couponNameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: GetBuilder<CouponController>(
            builder: (couponController) {
              return Column(
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
                          child: AddNewProductFields(
                            isCoupon: true,
                            fieldsKey: couponNameKey,
                            controllerAR: couponController.couponNameAr,
                            controllerEN: couponController.couponNameEn,
                            controllerHE: couponController.couponNameHe,
                            enable: couponController.status.value,
                          ),
                        ),
                      ),
                      7.horizontalSpace,
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          height:
                              MediaQuery.of(context).size.height * 1 / 1.3999,
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
                          child: CouponDetailsFields(
                            couponKey: couponKey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  Obx(() {
                    switch (couponController.controllerState.value) {
                      case ControllerState.loading:
                        return Center(
                          child: CircularProgressIndicator(
                              color: MyThemeData.light.primaryColor),
                        );
                      case ControllerState.error:
                        return Center(
                          child: CustomButton(
                            buttonText: 'save'.tr,
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
                              if(couponKey.currentState!.validate() && couponNameKey.currentState!.validate()){
                                couponController.createCoupon(context);
                              }
                            },
                          ),
                        );
                      default:
                        return Center(
                          child: CustomButton(
                            buttonText: 'save'.tr,
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
                              if(couponKey.currentState!.validate() && couponNameKey.currentState!.validate()){
                                couponController.createCoupon(context);
                              }
                            },
                          ),
                        );
                    }
                  }),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
