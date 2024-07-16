import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class WaitingForDeliveryScreen extends StatelessWidget {
  const WaitingForDeliveryScreen({super.key});

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
                  itemCount: allOrderController.waitingDeliveredList.length,
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
                                      'order #${allOrderController.waitingDeliveredList[index].id}',
                                      style: TajawalRegular.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    3.verticalSpace,
                                    Text(
                                      allOrderController.calculateSinceDays(
                                          allOrderController
                                              .waitingDeliveredList[index]
                                              .createdAt),
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
                                  '₪ ${allOrderController.waitingDeliveredList[index].totalPrice}',
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
                                              .waitingDeliveredList[index]);
                                    },
                                    child: SvgPicture.asset(Images.order_details)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ).paddingSymmetric(vertical: 5);
                  },
                ));
          }),
        ],
      ),
    );
  }
}