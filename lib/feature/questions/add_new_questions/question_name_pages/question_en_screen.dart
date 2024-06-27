import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/widgets/names_text_field.dart';

class QuestionEnScreen extends StatelessWidget {
  const QuestionEnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NamesTextField(
      title: 'English Question'.tr,
      hintTitle: 'English Answer'.tr,
    );
  }
}
