import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/widgets/names_text_field.dart';

class MealsHeScreen extends StatelessWidget {
  const MealsHeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NamesTextField(
      title: 'Hebrew Name'.tr,
      hintTitle: 'Details'.tr,
      hintTitle2: 'Hebrew Name'.tr,
    );
  }
}
