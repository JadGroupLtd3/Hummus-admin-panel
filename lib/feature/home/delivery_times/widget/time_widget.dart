import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/helper/responsive_helper.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/theme/light_theme.dart';
import 'package:hummus_admin_panel/widgets/custom_switch.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field.dart';
import 'package:hummus_admin_panel/widgets/time_text_format.dart';

class TimeWidget extends StatefulWidget {
  final String day;

  const TimeWidget({super.key, required this.day});

  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  bool _enable = false;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;

  @override
  void initState() {
    super.initState();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();
  }

  @override
  void dispose() {
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: ResponsiveHelper.isDesktop(context)
              ? MediaQuery.of(context).size.height * 1 / 2.8
              : MediaQuery.of(context).size.height * 1 / 3.3,
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
              width: ResponsiveHelper.isDesktop(context)
                  ? MediaQuery.of(context).size.height * 1 / 2.5
                  : MediaQuery.of(context).size.height * 1 / 3.3,
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
                hintText: '00:00',
                inputFormatters: [TimeTextFormatter()],
                hintStyle: TajawalRegular.copyWith(
                  fontSize: 13,
                ),
                inputType: TextInputType.datetime,
                controller: _startTimeController,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              'To',
              style: TajawalRegular.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 15),
            Container(
              width: ResponsiveHelper.isDesktop(context)
                  ? MediaQuery.of(context).size.height * 1 / 2.5
                  : MediaQuery.of(context).size.height * 1 / 3.3,
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
                hintText: '00:00',
                inputFormatters: [TimeTextFormatter()],
                hintStyle: TajawalRegular.copyWith(
                  fontSize: 13,
                ),
                inputType: TextInputType.datetime,
                controller: _endTimeController,
              ),
            ),
          ],
        ),
        CustomSwitch(
          value: _enable,
          onChanged: (val) {
            setState(() {
              _enable = val;
            });
          },
        ),
      ],
    ).paddingSymmetric(vertical: 8);
  }
}




