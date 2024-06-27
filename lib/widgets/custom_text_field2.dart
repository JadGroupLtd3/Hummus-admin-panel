import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';

class CustomTextField2 extends StatefulWidget {
  final String? hintText;
  final String? title;
  final IconData? icon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isPassword;
  final bool? isCalendar;
  final bool? isShowBorder;
  final bool? isAutoFocus;
  final bool? isBorder;
  final Function(String)? onSubmit;
  final bool? isEnabled;
  final int? maxLines;
  final bool? isShowSuffixIcon;
  final TextCapitalization? capitalization;
  final Function(String text)? onChanged;
  void Function()? onTap;
  final String? countryDialCode;
  final String? suffixIconUrl;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final String? Function(String?)? onValidate;
  final List<TextInputFormatter>? inputFormatters;
  final dynamic onDateSelect;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  final double? height;
  final double? width;
  final double? radius;
  final Color? fillColor;
  final bool? filled;
  final bool? isTitle;

  CustomTextField2({
    super.key,
    this.onTap,
    this.style,
    this.filled,
    this.isTitle = true,
    this.isBorder = true,
    this.fillColor,
    this.textAlign,
    this.inputFormatters,
    this.hintStyle,
    this.hintText = '',
    this.icon,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType,
    this.inputAction,
    this.maxLines = 1,
    this.isShowSuffixIcon = false,
    this.onSubmit,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.isCalendar = false,
    this.isShowBorder = false,
    this.isAutoFocus = false,
    this.countryDialCode,
    this.suffixIconUrl,
    this.onChanged,
    this.onValidate,
    this.onDateSelect,
    this.title,
    this.height,
    this.width,
    this.radius,
  });

  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isTitle == false
            ? const SizedBox.shrink()
            : Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            widget.title ?? '',
            style: widget.style ??
                TajawalRegular.copyWith(
                  fontSize: 16,
                ),
          ),
        ),
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: TextFormField(
            maxLines: widget.maxLines,
            controller: widget.controller,
            focusNode: widget.focusNode,
            textAlign: widget.textAlign ?? TextAlign.start,
            style: TajawalRegular.copyWith(
              fontSize: 14,
            ),
            textInputAction: widget.inputAction,
            keyboardType: widget.inputType,
            cursorColor: Theme.of(context).hintColor,
            textCapitalization: widget.capitalization!,
            readOnly: !widget.isEnabled!,
            autofocus: widget.isAutoFocus!,
            autofillHints: widget.inputType == TextInputType.name
                ? [AutofillHints.name]
                : widget.inputType == TextInputType.emailAddress
                    ? [AutofillHints.email]
                    : widget.inputType == TextInputType.phone
                        ? [AutofillHints.telephoneNumber]
                        : widget.inputType == TextInputType.streetAddress
                            ? [AutofillHints.fullStreetAddress]
                            : widget.inputType == TextInputType.url
                                ? [AutofillHints.url]
                                : widget.inputType ==
                                        TextInputType.visiblePassword
                                    ? [AutofillHints.password]
                                    : null,
            obscureText: widget.isPassword! ? _obscureText : false,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              errorStyle: TajawalBold.copyWith(
                fontSize: 14,
                color: Colors.red,
              ),
              constraints: const BoxConstraints(maxHeight: 60, minHeight: 35),
              isDense: true,
              border: widget.isBorder == false
                  ? null
                  : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xff000000).withOpacity(0.11),
                    width: 1,
                  ),
                  borderRadius:  BorderRadius.all(Radius.circular(widget.radius ?? 10))),
              enabledBorder: widget.isBorder == false
                  ? null
                  : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xff000000).withOpacity(0.11),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 10))),
              focusedBorder:widget.isBorder == false
                  ? null
                  : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xff000000).withOpacity(0.11),
                    width: 1,
                  ),
                  borderRadius:  BorderRadius.all(Radius.circular(widget.radius ?? 10))),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: true,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ??
                  TajawalRegular.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).hintColor,
                  ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isPassword!
                  ? IconButton(
                      icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).hintColor.withOpacity(0.3)),
                      onPressed: _toggle,
                    )
                  : widget.isCalendar!
                      ? IconButton(
                          icon: Icon(Icons.calendar_month,
                              color: Theme.of(context).primaryColor),
                          onPressed: widget.onDateSelect,
                        )
                      : widget.suffixIcon,
              fillColor: widget.fillColor ?? Colors.white,
              filled: widget.filled ?? true,
            ),
            onFieldSubmitted: (text) => widget.nextFocus != null
                ? FocusScope.of(context).requestFocus(widget.nextFocus)
                : widget.onSubmit != null
                    ? widget.onSubmit!(text)
                    : null,
            onChanged: widget.onChanged,
            validator: widget.onValidate != null ? widget.onValidate! : null,
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
