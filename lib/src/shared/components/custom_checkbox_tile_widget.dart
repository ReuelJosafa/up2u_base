import 'package:flutter/material.dart';

import 'custom_checkbox_widget.dart';

class CustomCheckboxTile extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;
  final TextStyle? style;
  const CustomCheckboxTile(
      {Key? key,
      required this.title,
      required this.value,
      this.onChanged,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCheckbox(
          value: true,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: style ?? Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}
