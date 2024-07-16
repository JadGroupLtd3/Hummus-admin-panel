import 'dart:developer';

import 'package:get/get.dart';

import 'package:hummus_admin_panel/core/core_export.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AllOrderController allOrderController = Get.find<AllOrderController>();

    return Obx(() {
      return allOrderController.currentOrderSelected.value == null
          ? const SizedBox()
          : Padding(
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
                            'order #${allOrderController.currentOrderSelected.value?.id}',
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            allOrderController.calculateSinceDays(
                                allOrderController
                                    .currentOrderSelected.value?.createdAt),
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
                                allOrderController.currentOrderSelected.value
                                        ?.customer?.image ??
                                    Images.background,
                                height: 36,
                                width: 36,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          3.horizontalSpace,
                          Text(
                            allOrderController.currentOrderSelected.value
                                    ?.customer?.name ??
                                'None',
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
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
                                    allOrderController
                                        .currentOrderSelected.value?.orderType,
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
                                    allOrderController.currentOrderSelected
                                            .value?.paymentType ??
                                        'none',
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
                                    '₪ ${allOrderController.currentOrderSelected.value?.totalPrice}'
                                        .tr,
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
                    itemCount: allOrderController
                        .currentOrderSelected.value?.meals?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xffE4E4E4))),
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
                                  allOrderController.currentOrderSelected.value
                                          ?.meals?[index]?.name?.ar ??
                                      'none',
                                  style: TajawalRegular.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '₪ ${allOrderController.currentOrderSelected.value?.meals?[index].price ?? 0}',
                              style: TajawalBold.copyWith(
                                  fontSize: 16,
                                  color: MyThemeData.light.focusColor),
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
                        '₪ ${allOrderController.currentOrderSelected.value?.totalPrice}'
                            .tr,
                        style: TajawalBold.copyWith(
                          fontSize: 16,
                          color: MyThemeData.light.focusColor,
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OnHover(
                        builder: (isHovered) {
                          return CustomButton(
                            buttonText: 'Accept'.tr,
                            icon: SvgPicture.asset(Images.correct),
                            backGroundColor: MyThemeData.light.primaryColor,
                            radius: 7,
                            width: 120,
                            height: 45,
                            onPressed: () {
                              inspect(allOrderController.currentOrderSelected);
                              if (allOrderController.currentOrderSelected.value
                                      ?.executionStep ==
                                  null) {
                                allOrderController.changeStatusOfOrder(
                                    allOrderController
                                        .currentOrderSelected.value?.id,
                                    "preparing",
                                    context);
                              } else if (allOrderController.currentOrderSelected
                                      .value?.executionStep ==
                                  "preparing") {
                                allOrderController.changeStatusOfOrder(
                                    allOrderController
                                        .currentOrderSelected.value?.id,
                                    "waiting_delivery",
                                    context);
                                allOrderController.getAllOrder(context);
                              } else if (allOrderController.currentOrderSelected
                                      .value?.executionStep ==
                                  "waiting_delivery") {
                                allOrderController.changeStatusOfOrder(
                                    allOrderController
                                        .currentOrderSelected.value?.id,
                                    "done",
                                    context);
                              }
                            },
                          );
                        },
                      ),
                      7.horizontalSpace,
                      OnHover(
                        builder: (isHovered) {
                          return CustomButton(
                            buttonText: 'Reject'.tr,
                            icon: SvgPicture.asset(Images.close),
                            backGroundColor: MyThemeData.light.focusColor,
                            radius: 7,
                            width: 120,
                            height: 45,
                            onPressed: () {
                              allOrderController.changeStatusOfOrder(
                                  allOrderController
                                      .currentOrderSelected.value?.id,
                                  "reject",
                                  context);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
    });
  }
}
