import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class MealsEnScreen extends StatelessWidget {
  const MealsEnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MealsController>(
      builder: (controller) => NamesTextField(
        title: 'English Name'.tr,
        hintTitle: 'Details'.tr,
        hintTitle2: 'English Name'.tr,
        nameController: controller.mealEnglishName,
        detailsController: controller.mealEnglishDescription,
      ),
    );
  }
}
