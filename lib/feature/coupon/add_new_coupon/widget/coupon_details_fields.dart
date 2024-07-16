import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:intl/intl.dart';


class CouponDetailsFields extends StatefulWidget {
  final GlobalKey<FormState> couponKey;
  const CouponDetailsFields({super.key,required this.couponKey});

  @override
  State<CouponDetailsFields> createState() => _CouponDetailsFieldsState();
}

class _CouponDetailsFieldsState extends State<CouponDetailsFields> {
  final CouponController couponController = Get.find<CouponController>();

  Future<void> selectDateTime(BuildContext context) async {
    DateTime initialDateTime = DateTime.now();
    final DateTime? pickedDateTime = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DateTimePickerDialog(initialDateTime: initialDateTime);
      },
    );
    if (pickedDateTime != null) {
      couponController.couponEndDate.text =
          DateFormat('yyyy-MM-dd hh:mm:ss a').format(pickedDateTime);
    }
  }
  String title = 'Type of discount'.tr;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: GetBuilder<CouponController>(
        builder: (couponController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: widget.couponKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField2(
                            title: 'Code'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'Code'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            onValidate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field is required'.tr;
                              }
                              return null;
                            },
                            controller: couponController.couponCode,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CustomTextField2(
                            title: 'Number of uses per laser'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'Number of uses per laser'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            controller: couponController.couponUseUserCount,
                          ),
                        ),
                      ],
                    ),
                    17.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField2(
                            title: 'Number of times the coupon was used'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'Number of times the coupon was used'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            controller: couponController.couponUseCount,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CustomTextField2(
                            title: 'Discount'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'Discount'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            controller: couponController.couponDiscount,
                          ),
                        ),
                      ],
                    ),
                    17.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                                child: Text(
                                  'Type of discount'.tr,
                                  style: TajawalRegular.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DropDownBTN(
                                title: couponController.discountType.value == 1
                                    ? 'static price'.tr
                                    : title,
                                onChanged: (String? val) {
                                  setState(() {
                                    if(val != null){
                                      title = val;
                                    }
                                  });
                                  if(val == 'static price'.tr){
                                    couponController.discountType.value = 1;
                                    print(couponController.discountType.value);
                                  }
                                },
                                items: ['static price'.tr].map((val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(
                                        val,
                                        style: TajawalRegular.copyWith(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                              const SizedBox(height:22),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CustomTextField2(
                            title: 'The lowest invoice price'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'The lowest invoice price'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            controller: couponController.couponMinPrice,
                          ),
                        ),
                      ],
                    ),
                    17.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField2(
                            title: 'Expiry date'.tr,
                            style: TajawalRegular.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            height: 60,
                            radius: 20,
                            hintText: 'dd/mm/yy, --:-- --'.tr,
                            inputType: TextInputType.text,
                            filled: false,
                            controller: couponController.couponEndDate,
                            onTap: () async {
                              await selectDateTime(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                                child: Text(
                                  'Assign to a user'.tr,
                                  style: TajawalRegular.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DropDownBTN(
                                title: 'Assign to a user'.tr,
                              ),
                              const SizedBox(height:14),
                            ],
                          ),
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    Center(
                      child: CustomSwitch(
                        value: couponController.status.value,
                        onChanged: (val) {
                          val == true
                              ? couponController.status.value = true
                              : couponController.status.value = false;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },),
    );
  }
}
