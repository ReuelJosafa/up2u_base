import 'package:flutter/material.dart';

import '../../../shared/components/custom_checkbox_widget.dart';

class CustomTrailingCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;
  final TextStyle? style;
  const CustomTrailingCheckbox(
      {Key? key,
      required this.title,
      required this.value,
      this.onChanged,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style ?? Theme.of(context).textTheme.bodyText1,
        ),
        CustomCheckbox(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
