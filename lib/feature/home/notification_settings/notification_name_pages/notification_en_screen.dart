import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class NotificationEnScreen extends StatelessWidget {
  const NotificationEnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationController) {
        return NotificationTextsField(
          stateKey: notificationController.notificationEnKey,
          newOrderController: notificationController.newOrderTextEnglish,
          acceptOrderController: notificationController.acceptOrderTextEnglish,
          rejectOrderController: notificationController.rejectOrderEnglish,
          preparingOrderController: notificationController.preparingOrderEnglish,
          pickupOrderController: notificationController.pickupOrderEnglish,
          deliveryOrderController: notificationController.deliveryOrderEnglish,
          onWayOrderController: notificationController.onWayOrderEnglish,
          doneOrderController: notificationController.doneOrderEnglish,
        );
      },
    );
  }
}
