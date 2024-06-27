import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/widgets/names_text_field.dart';

class QuestionArScreen extends StatelessWidget {
  const QuestionArScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NamesTextField(
      title: 'Arabic Question'.tr,
      hintTitle: 'Arabic Answer'.tr,
    );
  }
}
