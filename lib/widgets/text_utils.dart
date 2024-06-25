import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';

class TextUtils extends StatelessWidget {
  final String title;
  final Color? color;
  const TextUtils({super.key,required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TajawalRegular.copyWith(fontSize: 14, color: color ?? Colors.black),
    ).paddingSymmetric(vertical: 12);
  }
}
