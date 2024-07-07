import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class MealsHeScreen extends StatelessWidget {
  const MealsHeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (controller) => NamesTextField(
        title: 'Hebrew Name'.tr,
        hintTitle: 'Details'.tr,
        hintTitle2: 'Hebrew Name'.tr,
        nameController: controller.mealHebrewName,
        detailsController: controller.mealHebrewDescription,
      ),
    );
  }
}
