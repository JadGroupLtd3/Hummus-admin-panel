import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/images.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/feature/main/controller/slider_pages_controller.dart';
import 'package:hummus_admin_panel/feature/orders/controller/order_controller.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';

class ProcessingOrderScreen extends StatelessWidget {
  const ProcessingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllOrderController allOrderController = Get.find<AllOrderController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        children: [
          Obx(() {
            if (allOrderController.controllerState.value ==
                ControllerState.loading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: allOrderController.preparingList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black.withOpacity(0.08)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                Images.order,
                                color: Colors.black,
                              ),
                              5.horizontalSpace,
                              Column(
                                children: [
                                  Text(
                                    'order #${allOrderController.preparingList[index].id}',
                                    style: TajawalRegular.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  3.verticalSpace,
                                  Text(
                                    allOrderController.calculateSinceDays(
                                        allOrderController
                                            .preparingList[index].createdAt),
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
                              Text(
                                '₪ ${allOrderController.preparingList[index].totalPrice}',
                                style: TajawalBold.copyWith(
                                  fontSize: 14,
                                  color: MyThemeData.light.focusColor,
                                ),
                              ),
                              5.horizontalSpace,
                              InkWell(
                                  onTap: () {
                                    allOrderController.selectOrder(
                                        allOrderController
                                            .preparingList[index]);
                                  },
                                  child:
                                      SvgPicture.asset(Images.order_details)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).paddingSymmetric(vertical: 5);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
