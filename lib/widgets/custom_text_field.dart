import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hummus_admin_panel/core/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final String? title;
  final IconData? icon;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isPassword;
  final bool? isShowBorder;
  final bool? isAutoFocus;
  final Function(String)? onSubmit;
  final bool? isEnabled;
  final int? maxLines;
  final int? minLines;
  final bool? isShowSuffixIcon;
  final TextCapitalization? capitalization;
  final Function(String text)? onChanged;
  final String? countryDialCode;
  final Widget? suffixIconUrl;
  final double? fontSize;
  final double? height;
  final double? radius;
  final Color? fillColor;
  final void Function()? onTap;
  final bool? filled;

  final String? Function(String?)? onValidate;

  const CustomTextField({super.key, 
    this.hintText = '',
    this.hintStyle,
    this.controller,
    this.onTap,
    this.fillColor,
    this.inputFormatters,
    this.filled,
    this.radius,
    this.fontSize,
    this.height,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.minLines = 1,
    this.isShowSuffixIcon = false,
    this.onSubmit,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.isShowBorder = false,
    this.isAutoFocus = false,
    this.countryDialCode,
    this.suffixIconUrl,
    this.onChanged,
    this.onValidate,
    this.title,
    this.icon,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        onTap: widget.onTap,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: TajawalRegular.copyWith(
          fontSize: widget.fontSize ?? 12.5,
        ),
        textInputAction: widget.inputAction,
        keyboardType: widget.inputType,
        cursorColor: Theme.of(context).hintColor,
        textCapitalization: widget.capitalization!,
        enabled: widget.isEnabled,
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
                            : widget.inputType == TextInputType.visiblePassword
                                ? [AutofillHints.password]
                                : null,
        obscureText: widget.isPassword! ? _obscureText : false,
        inputFormatters: widget.inputType == TextInputType.phone
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
              ]
            : widget.inputFormatters,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          constraints: const BoxConstraints(maxHeight: 60, minHeight: 35),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xff000000).withOpacity(0.11),
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 500))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xff000000).withOpacity(0.11),
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 500))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xff000000).withOpacity(0.11),
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 500))),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ?? TajawalLight.copyWith(
              fontSize: widget.fontSize ?? 11,
              color: Theme.of(context).hintColor.withOpacity(1)),
          prefixIcon: widget.icon != null
              ? Icon(widget.icon,color: Colors.black)
              : null,
          suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).hintColor.withOpacity(0.3)),
                  onPressed: _toggle,
                )
              : widget.suffixIconUrl != null
              ? widget.suffixIconUrl : null,
          fillColor: widget.fillColor ?? Colors.white,
          filled: widget.filled ?? false,
        ),
        onFieldSubmitted: (text) => widget.nextFocus != null
            ? FocusScope.of(context).requestFocus(widget.nextFocus)
            : widget.onSubmit != null
                ? widget.onSubmit!(text)
                : null,
        onChanged: widget.onChanged,
        validator: widget.onValidate != null ? widget.onValidate! : null,
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
