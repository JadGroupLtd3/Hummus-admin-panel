import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class NotificationHeScreen extends StatelessWidget {
  const NotificationHeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationController) {
        return NotificationTextsField(
          stateKey: notificationController.notificationHeKey,
          newOrderController: notificationController.newOrderTextHebrew,
          acceptOrderController: notificationController.acceptOrderTextHebrew,
          rejectOrderController: notificationController.rejectOrderHebrew,
          preparingOrderController: notificationController.preparingOrderHebrew,
          pickupOrderController: notificationController.pickupOrderHebrew,
          deliveryOrderController: notificationController.deliveryOrderHebrew,
          onWayOrderController: notificationController.onWayOrderHebrew,
          doneOrderController: notificationController.doneOrderHebrew,
        );
      },
    );
  }
}
