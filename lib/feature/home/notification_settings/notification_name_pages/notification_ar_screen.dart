import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/widgets/names_text_field.dart';

class NotificationArScreen extends StatelessWidget {
  const NotificationArScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NamesTextField(
      title: 'Arabic Notification'.tr,
      hintTitle: 'Arabic Notification'.tr,
    );
  }
}
