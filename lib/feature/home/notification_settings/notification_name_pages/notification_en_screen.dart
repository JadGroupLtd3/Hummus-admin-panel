import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/widgets/names_text_field.dart';

class NotificationEnScreen extends StatelessWidget {
  const NotificationEnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NamesTextField(
      title: 'English Notification'.tr,
      hintTitle: 'English Notification'.tr,
    );
  }
}
