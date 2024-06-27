import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/widgets/names_text_field.dart';

class MealsEnScreen extends StatelessWidget {
  const MealsEnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NamesTextField(
      title: 'English Name'.tr,
      hintTitle: 'Details'.tr,
      hintTitle2: 'English Name'.tr,
    );
  }
}
