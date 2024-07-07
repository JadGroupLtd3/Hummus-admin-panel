import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/feature/deals/controller/deals_controller.dart';
import 'package:hummus_admin_panel/widgets/names_text_field.dart';

class DealsEnScreen extends StatelessWidget {
  const DealsEnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DealsController>(
      builder: (controller) => NamesTextField(
        title: 'English Name'.tr,
        hintTitle: 'Details'.tr,
        hintTitle2: 'English Name'.tr,
        nameController: controller.dealEnglishName,
        detailsController: controller.dealEnglishDescription,
      ),
    );
  }
}
