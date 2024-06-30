import 'package:flutter/material.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';

class ShowSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    int? secondes,
    bool? isSuccess,
    Color color = Colors.transparent,
  }) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: TajawalRegular.copyWith(
                fontSize: 14,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            backgroundColor: color,
            elevation: 1,
            duration: Duration(seconds: secondes ?? 3),
            behavior: SnackBarBehavior.floating,
          ),
        )
        .closed
        .then((value) {
      if (context.mounted) ScaffoldMessenger.of(context).clearSnackBars();
    });
  }
}
