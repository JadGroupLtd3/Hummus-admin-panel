import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class NotificationTextsField extends StatelessWidget {
  final TextEditingController newOrderController;
  final TextEditingController acceptOrderController;
  final TextEditingController rejectOrderController;
  final TextEditingController preparingOrderController;
  final TextEditingController pickupOrderController;
  final TextEditingController deliveryOrderController;
  final TextEditingController onWayOrderController;
  final TextEditingController doneOrderController;
  final GlobalKey<FormState> stateKey;
  const NotificationTextsField({
    super.key,
    required this.stateKey,
    required this.newOrderController,
    required this.acceptOrderController,
    required this.rejectOrderController,
    required this.preparingOrderController,
    required this.pickupOrderController,
    required this.deliveryOrderController,
    required this.onWayOrderController,
    required this.doneOrderController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: stateKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Order'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ).paddingAll(5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: CustomTextField(
                height: 45,
                radius: 30,
                filled: false,
                controller: newOrderController,
              ),
            ),
            5.verticalSpace,
            Text(
              'Order Accept'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ).paddingAll(5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: CustomTextField(
                height: 45,
                radius: 30,
                filled: false,
                controller: acceptOrderController,
              ),
            ),
            5.verticalSpace,
            Text(
              'Order Reject'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ).paddingAll(5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: CustomTextField(
                height: 45,
                radius: 30,
                filled: false,
                controller: rejectOrderController,
              ),
            ),
            5.verticalSpace,
            Text(
              'Order preparing'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ).paddingAll(5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: CustomTextField(
                height: 45,
                radius: 30,
                filled: false,
                controller: preparingOrderController,
              ),
            ),
            5.verticalSpace,
            Text(
              'Order Pickup'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ).paddingAll(5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: CustomTextField(
                height: 45,
                radius: 30,
                filled: false,
                controller: pickupOrderController,
              ),
            ),
            5.verticalSpace,
            Text(
              'Waiting to receive the delivery'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ).paddingAll(5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: CustomTextField(
                height: 45,
                radius: 30,
                filled: false,
                controller: deliveryOrderController,
              ),
            ),
            5.verticalSpace,
            Text(
              'Order On Way'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ).paddingAll(5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: CustomTextField(
                height: 45,
                radius: 30,
                filled: false,
                controller: onWayOrderController,
              ),
            ),
            5.verticalSpace,
            Text(
              'Order Complete'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ).paddingAll(5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: CustomTextField(
                height: 45,
                radius: 30,
                filled: false,
                controller: doneOrderController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
