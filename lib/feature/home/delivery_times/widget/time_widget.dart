import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class TimeWidget extends StatefulWidget {
  final String day;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  void Function(bool)? onChanged;
  bool? enable;

  TimeWidget({
    super.key,
    this.enable,
    this.onChanged,
    required this.day,
    required this.startDateController,
    required this.endDateController,
  });

  @override
  TimeWidgetState createState() => TimeWidgetState();
}

class TimeWidgetState extends State<TimeWidget> {

  Future<TimeOfDay?> selectTime(
      BuildContext context, TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      final now = DateTime.now();
      final selectedTime = DateTime(
          now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
      controller.text = DateFormat('hh:mm:ss a').format(selectedTime);
    }
    return pickedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.height * 1 / 4.3,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MyThemeData.light.backgroundColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(0.03),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Icon(
                Icons.date_range_outlined,
                color: MyThemeData.light.primaryColor,
              ),
              const SizedBox(width: 10),
              Text(
                widget.day,
                style: TajawalRegular.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.height * 1 / 3.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    color: Colors.black.withOpacity(0.22),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: CustomTextField(
                height: 45,
                radius: 15,
                hintText: '00:00 AM'.tr,
                inputFormatters: [TimeTextFormatter()],
                hintStyle: TajawalRegular.copyWith(
                  fontSize: 13,
                ),
                onTap: () async {
                  await selectTime(context, widget.startDateController);
                },
                inputType: TextInputType.datetime,
                controller: widget.startDateController,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              'To'.tr,
              style: TajawalRegular.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 15),
            Container(
              width: MediaQuery.of(context).size.height * 1 / 3.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    color: Colors.black.withOpacity(0.22),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: CustomTextField(
                height: 45,
                radius: 15,
                hintText: '00:00 PM'.tr,
                inputFormatters: [TimeTextFormatter()],
                hintStyle: TajawalRegular.copyWith(
                  fontSize: 13,
                ),
                inputType: TextInputType.datetime,
                controller: widget.endDateController,
                onTap: () async {
                  await selectTime(context, widget.endDateController);
                },
              ),
            ),
          ],
        ),
        CustomSwitch(
          value: widget.enable ?? false,
          onChanged: widget.onChanged ?? (val) {
            setState(() {
              widget.enable = val;
            });
          },
        ),
      ],
    ).paddingSymmetric(vertical: 8);
  }
}
