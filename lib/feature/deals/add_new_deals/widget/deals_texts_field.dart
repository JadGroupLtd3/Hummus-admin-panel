import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class DealsTextsField extends StatefulWidget {
  final GlobalKey<FormState> dealKey;
  const DealsTextsField({super.key,required this.dealKey});

  @override
  State<DealsTextsField> createState() => _DealsTextsFieldState();
}

class _DealsTextsFieldState extends State<DealsTextsField> {

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DealsController>(
      builder: (dealsController) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: MediaQuery.of(context).size.height * 1 / 2.5,
              width: MediaQuery.of(context).size.height * 1 / 0.8,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Form(
                  key: widget.dealKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      20.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      size: 20,
                                      color: MyThemeData.light.focusColor,
                                    ).paddingSymmetric(horizontal: 7),
                                    Text(
                                      'Price'.tr,
                                      style: TajawalRegular.copyWith(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                CustomTextField(
                                  height: 45,
                                  radius: 20,
                                  hintText: 'Price'.tr,
                                  inputType: TextInputType.phone,
                                  controller: dealsController.totalPriceDeal,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range_outlined,
                                      size: 20,
                                      color: MyThemeData.light.focusColor,
                                    ).paddingSymmetric(horizontal: 7),
                                    Text(
                                      'Start date'.tr,
                                      style: TajawalRegular.copyWith(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                CustomTextField(
                                  height: 45,
                                  radius: 20,
                                  hintText: 'Start date'.tr,
                                  inputType: TextInputType.text,
                                  onTap: () {
                                    selectDate(context, dealsController.startDateDeal);
                                  },
                                  controller: dealsController.startDateDeal,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range_outlined,
                                      size: 20,
                                      color: MyThemeData.light.focusColor,
                                    ).paddingSymmetric(horizontal: 7),
                                    Text(
                                      'End date'.tr,
                                      style: TajawalRegular.copyWith(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                CustomTextField(
                                  height: 45,
                                  radius: 20,
                                  hintText: 'End date'.tr,
                                  inputType: TextInputType.text,
                                  onTap: () {
                                    selectDate(context, dealsController.endDateDeal);
                                  },
                                  controller: dealsController.endDateDeal,
                                ),
                              ],
                            ),
                          ),
                          30.horizontalSpace,
                        ],
                      ),
                      25.verticalSpace,
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.numbers_outlined,
                                    size: 20,
                                    color: MyThemeData.light.focusColor,
                                  ).paddingSymmetric(horizontal: 7),
                                  Text(
                                    'Number of uses per laser'.tr,
                                    style: TajawalRegular.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: MediaQuery.of(context).size.height *
                                    1 /
                                    2.6,
                                child: CustomTextField(
                                  height: 45,
                                  radius: 20,
                                  hintText: 'Number of uses per laser'.tr,
                                  inputType: TextInputType.phone,
                                  controller: dealsController.userUseCountDeal,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          CustomSwitch(
                            value: dealsController.status.value,
                            onChanged: (val) {
                              val == true
                                  ? dealsController.status.value = true
                                  : dealsController.status.value = false;
                            },
                          ).paddingOnly(top: 25),
                        ],
                      ),
                      25.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
