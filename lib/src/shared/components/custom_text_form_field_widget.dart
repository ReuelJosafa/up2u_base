import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final Icon? suffixIcon;
  const CustomTextFormField(
      {Key? key, required this.title, required this.hintText, this.suffixIcon})
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
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          TextFormField(
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
                hintText: hintText,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSecondary,
                        width: 1)),
                suffixIcon: suffixIcon),
          ),
        ],
      ),
    );
  }
}
