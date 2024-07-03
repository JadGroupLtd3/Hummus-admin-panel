import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class DeliveryTimesScreen extends StatefulWidget {
  const DeliveryTimesScreen({super.key});

  @override
  State<DeliveryTimesScreen> createState() => _DeliveryTimesScreenState();
}

class _DeliveryTimesScreenState extends State<DeliveryTimesScreen> {
  final List days = [
    'Saturday'.tr,
    'Sunday'.tr,
    'Monday'.tr,
    'Tuesday'.tr,
    'Wednesday'.tr,
    'Thursday'.tr,
    'Friday'.tr,
  ];
  final DeliveryTimeController deliveryTimeController = Get.find<DeliveryTimeController>();
  @override
  void initState() {
    deliveryTimeController.getDeliveryTime(context);
    deliveryTimeController.initDeliveryTime(deliveryTimeController.deliveryTime.value!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: GetBuilder<DeliveryTimeController>(
            builder: (deliveryTimeController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${'Home'.tr} / ${'Delivery Time'.tr}',
                    style: TajawalRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          height: MediaQuery.of(context).size.height * 1 / 1.26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 14,
                                spreadRadius: 9,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            child: Column(
                              children: [
                                ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    TimeWidget(
                                      day: days[0],
                                      startDateController: deliveryTimeController.from_1,
                                      endDateController: deliveryTimeController.to_1,
                                      enable: deliveryTimeController.workStatus_1.value,
                                      onChanged: (val) {
                                        val == true
                                            ? deliveryTimeController.workStatus_1.value = true
                                            : deliveryTimeController.workStatus_1.value = false;
                                      },
                                    ),
                                    TimeWidget(
                                      day: days[1],
                                      startDateController: deliveryTimeController.from_2,
                                      endDateController: deliveryTimeController.to_2,
                                      enable: deliveryTimeController.workStatus_2.value,
                                      onChanged: (val) {
                                        val == true ?
                                        deliveryTimeController.workStatus_2.value = true
                                            : deliveryTimeController.workStatus_2.value =
                                        false;
                                      },
                                    ),
                                    TimeWidget(
                                      day: days[2],
                                      startDateController: deliveryTimeController.from_3,
                                      endDateController: deliveryTimeController.to_3,
                                      enable: deliveryTimeController.workStatus_3.value,
                                      onChanged: (val) {
                                        val == true ?
                                        deliveryTimeController.workStatus_3.value = true
                                            : deliveryTimeController.workStatus_3.value =
                                        false;
                                      },
                                    ),
                                    TimeWidget(
                                      day: days[3],
                                      startDateController: deliveryTimeController.from_4,
                                      endDateController: deliveryTimeController.to_4,
                                      enable: deliveryTimeController.workStatus_4.value,
                                      onChanged: (val) {
                                        val == true ?
                                        deliveryTimeController.workStatus_4.value = true
                                            : deliveryTimeController.workStatus_4.value =
                                        false;
                                      },
                                    ),
                                    TimeWidget(
                                      day: days[4],
                                      startDateController: deliveryTimeController.from_5,
                                      endDateController: deliveryTimeController.to_5,
                                      enable: deliveryTimeController.workStatus_5.value,
                                      onChanged: (val) {
                                        val == true ?
                                        deliveryTimeController.workStatus_5.value = true
                                            : deliveryTimeController.workStatus_5.value =
                                        false;
                                      },
                                    ),
                                    TimeWidget(
                                      day: days[5],
                                      startDateController: deliveryTimeController.from_6,
                                      endDateController: deliveryTimeController.to_6,
                                      enable: deliveryTimeController.workStatus_6.value,
                                      onChanged: (val) {
                                        val == true ?
                                        deliveryTimeController.workStatus_6.value = true
                                            : deliveryTimeController.workStatus_6.value =
                                        false;
                                      },
                                    ),
                                    TimeWidget(
                                      day: days[6],
                                      startDateController: deliveryTimeController.from_7,
                                      endDateController: deliveryTimeController.to_7,
                                      enable: deliveryTimeController.workStatus_7.value,
                                      onChanged: (val) {
                                        val == true ?
                                        deliveryTimeController.workStatus_7.value = true
                                            : deliveryTimeController.workStatus_7.value =
                                        false;
                                      },
                                    ),
                                  ],
                                ),
                                5.verticalSpace,
                                Obx(() {
                                  switch (deliveryTimeController.controllerState.value) {
                                    case ControllerState.loading:
                                      return Row(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CircularProgressIndicator(
                                            color: MyThemeData.light.primaryColor,
                                          ),
                                          12.horizontalSpace,
                                        ],
                                      );
                                    case ControllerState.error:
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CustomButton(
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
                                              deliveryTimeController.createDeliveryTime(context);
                                            },
                                          ),
                                        ],
                                      );
                                    default:
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CustomButton(
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
                                              deliveryTimeController.createDeliveryTime(context);
                                            },
                                          ),
                                        ],
                                      );
                                  }
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },),
        ),
      ),
    );
  }
}
