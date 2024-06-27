import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';
import 'package:hummus_admin_panel/widgets/custom_text_field.dart';

class NamesTextField extends StatelessWidget {
  final String title;
  final String hintTitle;
  final String? hintTitle2;
  const NamesTextField({super.key,required this.title,required this.hintTitle,this.hintTitle2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TajawalRegular.copyWith(
            fontSize: 16,
            color: Colors.black,
          ),
        ).paddingAll(5),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
          ),
          child: CustomTextField(
            hintText: hintTitle2 ?? 'Question'.tr,
            height: 45,
            radius: 30,
            filled: false,
          ),
        ),
        30.verticalSpace,
        Text(
          hintTitle,
          style: TajawalRegular.copyWith(
            fontSize: 16,
            color: Colors.black,
          ),
        ).paddingAll(5),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child: TextFormField(
            minLines: 15,
            maxLines: 30,
            style: TajawalRegular.copyWith(
              fontSize: 16,
            ),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintTitle,
              hintStyle: TajawalLight.copyWith(
                fontSize: 14,
                color: Theme.of(context).hintColor.withOpacity(1),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xff000000).withOpacity(0.11),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xff000000).withOpacity(0.11),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xff000000).withOpacity(0.11),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
            ),
          ),
        ),
      ],
    );
  }
}
