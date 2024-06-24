import 'package:flutter/services.dart';

class TimeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    newText = newText.replaceAll(RegExp(r'[^0-9:]'), '');
    if (newText.length > 2 && !newText.contains(':')) {
      newText = '${newText.substring(0, 2)}:${newText.substring(2)}';
    }
    if (newText.length > 5) {
      newText = newText.substring(0, 5);
    }
    if (newText.length == 5) {
      int hour = int.tryParse(newText.substring(0, 2)) ?? 0;
      int minute = int.tryParse(newText.substring(3, 5)) ?? 0;
      if (hour > 23) hour = 23;
      if (minute > 59) minute = 59;
      newText = '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}