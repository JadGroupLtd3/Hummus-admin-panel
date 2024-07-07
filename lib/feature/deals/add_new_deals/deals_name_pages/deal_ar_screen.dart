import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/feature/deals/controller/deals_controller.dart';
import 'package:hummus_admin_panel/widgets/names_text_field.dart';

class DealsArScreen extends StatelessWidget {
  const DealsArScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DealsController>(
      builder: (controller) => NamesTextField(
        title: 'Arabic Name'.tr,
        hintTitle: 'Details'.tr,
        hintTitle2: 'Arabic Name'.tr,
        nameController: controller.dealArabicName,
        detailsController: controller.dealArabicDescription,
      ),
    );
  }
}
