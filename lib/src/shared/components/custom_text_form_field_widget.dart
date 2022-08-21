import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final Icon? suffixIcon;
  final TextStyle? titleStyle;
  final TextStyle? inputStyle;
  final TextStyle? hintStyle;
  final Color? underlineColor;
  const CustomTextFormField(
      {Key? key,
      required this.title,
      required this.hintText,
      this.suffixIcon,
      this.titleStyle,
      this.inputStyle,
      this.underlineColor,
      this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
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
          ),
        ],
      ),
    );
  }
}
