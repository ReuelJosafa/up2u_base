import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommmomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final Icon? suffixIcon;
  final double bottomPadding;
  final double topPadding;
  final TextStyle? titleStyle;
  final TextStyle? inputStyle;
  final TextStyle? hintStyle;
  final Color? underlineColor;
  final TextEditingController? controller;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  const CommmomTextFormField(
      {Key? key,
      required this.title,
      required this.hintText,
      this.suffixIcon,
      this.titleStyle,
      this.inputStyle,
      this.underlineColor,
      this.hintStyle,
      this.controller,
      this.readOnly = false,
      this.keyboardType,
      this.inputFormatters,
      this.onChanged,
      this.onTap,
      this.onFieldSubmitted,
      this.textInputAction = TextInputAction.next,
      this.focusNode,
      this.bottomPadding = 12,
      this.topPadding = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle ??
                Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w500),
          ),
          TextFormField(
            controller: controller,
            onTap: onTap,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            style: inputStyle ?? Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
                hintStyle: hintStyle,
                hintText: hintText,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: underlineColor ??
                            Theme.of(context).colorScheme.onSecondary,
                        width: 1)),
                suffixIcon: suffixIcon),
            readOnly: readOnly,
          ),
        ],
      ),
    );
  }
}
