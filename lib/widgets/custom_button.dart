import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final bool? transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;
  final double? paddingTop;
  final Widget? icon;
  final Color? color;
  final TextStyle? style;
  final Color? backGroundColor;
  final Color? borderColor;

  const CustomButton({
    super.key,
    this.onPressed,
    this.paddingTop,
    this.buttonText,
    this.transparent = false,
    this.margin,
    this.width,
    this.style,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.radius = 5,
    this.icon,
    this.borderColor,
    this.color,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: backGroundColor,
      minimumSize: Size(
        width != null ? width! : 1170,
        height != null ? height! : 45,
      ),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          radius!,
        ),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
        ), // Add this line to set the border color
      ),
    );

    return Center(
      child: SizedBox(
        width: width ?? 1170,
        child: Padding(
          padding: margin == null ? const EdgeInsets.all(0) : margin!,
          child: TextButton(
            onPressed: onPressed,
            style: flatButtonStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox(),
                Text(
                  buttonText ?? '',
                  textAlign: TextAlign.center,
                  style: style ??
                      TajawalBold.copyWith(
                        color: transparent!
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        fontSize: fontSize ?? 16,
                        fontWeight: fontWeight ?? FontWeight.bold,
                      ),
                ).paddingOnly(top: paddingTop ?? 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
