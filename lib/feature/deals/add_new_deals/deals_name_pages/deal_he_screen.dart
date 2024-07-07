import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/feature/deals/controller/deals_controller.dart';
import 'package:hummus_admin_panel/widgets/names_text_field.dart';

class DealsHeScreen extends StatelessWidget {
  const DealsHeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DealsController>(
      builder: (controller) => NamesTextField(
        title: 'Hebrew Name'.tr,
        hintTitle: 'Details'.tr,
        hintTitle2: 'Hebrew Name'.tr,
        nameController: controller.dealHebrewName,
        detailsController: controller.dealHebrewDescription,
      ),
    );
  }
}
