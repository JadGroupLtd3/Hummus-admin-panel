import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class MealsArScreen extends StatelessWidget {
  const MealsArScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (controller) => NamesTextField(
        title: 'Arabic Name'.tr,
        hintTitle: 'Details'.tr,
        hintTitle2: 'Arabic Name'.tr,
        nameController: controller.mealArabicName,
        detailsController: controller.mealArabicDescription,
      ),
    );
  }
}
