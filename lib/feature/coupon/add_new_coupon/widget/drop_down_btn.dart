import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';


class DropDownBTN extends StatefulWidget {
  final String title;
  const DropDownBTN({super.key,required this.title});

  @override
  State<DropDownBTN> createState() => _DropDownBTNState();
}

class _DropDownBTNState extends State<DropDownBTN> {
  String? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black.withOpacity(.10),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            _dropDownValue ?? widget.title,
            style: TajawalRegular.copyWith(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          isExpanded: true,
          iconSize: 30.0,
          style: TajawalRegular.copyWith(
            fontSize: 14,
            color: Colors.black,
          ),
          items: ['One', 'Two', 'Three'].map(
                (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(
                  val,
                  style: TajawalRegular.copyWith(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
                  () {
                _dropDownValue = val;
              },
            );
          },
        ),
      ),
    );
  }
}

