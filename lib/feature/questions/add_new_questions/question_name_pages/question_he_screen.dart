import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/widgets/names_text_field.dart';

class QuestionHeScreen extends StatelessWidget {
  const QuestionHeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NamesTextField(
      title: 'Hebrew Question'.tr,
      hintTitle: 'Hebrew Answer'.tr,
    );
  }
}
