import 'package:flutter/material.dart';

class TextUnderlinedButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const TextUnderlinedButton(
      {Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(decoration: TextDecoration.underline)),
      ),
    );
  }
}
