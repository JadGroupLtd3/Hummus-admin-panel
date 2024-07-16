import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:intl/intl.dart';

class DateTimePickerDialog extends StatefulWidget {
  final DateTime initialDateTime;

  DateTimePickerDialog({required this.initialDateTime});

  @override
  _DateTimePickerDialogState createState() => _DateTimePickerDialogState();
}

class _DateTimePickerDialogState extends State<DateTimePickerDialog> {
  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDateTime;
    selectedTime = TimeOfDay.fromDateTime(widget.initialDateTime);
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select Date and Time'.tr,
        style: TajawalRegular.copyWith(
          fontSize: 16,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              '${'Date:'.tr} ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
              style: TajawalRegular.copyWith(
                fontSize: 14,
              ),
            ),
            trailing: const Icon(Icons.calendar_today),
            onTap: () => _selectDate(context),
          ),
          ListTile(
            title: Text(
              '${'Time:'.tr} ${selectedTime.format(context)}',
              style: TajawalRegular.copyWith(
                fontSize: 14,
              ),
            ),
            trailing: const Icon(Icons.access_time),
            onTap: () => _selectTime(context),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, null),
          child: Text(
            'Cancel'.tr,
            style: TajawalRegular.copyWith(
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            final selectedDateTime = DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              selectedTime.hour,
              selectedTime.minute,
            );
            Navigator.pop(context, selectedDateTime);
          },
          child: Text(
            'OK'.tr,
            style: TajawalRegular.copyWith(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
