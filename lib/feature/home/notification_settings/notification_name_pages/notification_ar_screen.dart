import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';


class NotificationArScreen extends StatelessWidget {
  const NotificationArScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationController) {
        return NotificationTextsField(
          stateKey: notificationController.notificationArKey,
          newOrderController: notificationController.newOrderTextArabic,
          acceptOrderController: notificationController.acceptOrderTextArabic,
          rejectOrderController: notificationController.rejectOrderArabic,
          preparingOrderController: notificationController.preparingOrderArabic,
          pickupOrderController: notificationController.pickupOrderArabic,
          deliveryOrderController: notificationController.deliveryOrderArabic,
          onWayOrderController: notificationController.onWayOrderArabic,
          doneOrderController: notificationController.doneOrderArabic,
        );
      },
    );
  }
}
