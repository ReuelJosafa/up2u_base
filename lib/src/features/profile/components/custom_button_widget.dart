import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool bottomDivider;
  final bool rigthArrow;
  final bool titleUnderline;
  const CustomButton(
      {Key? key,
      required this.title,
      this.onTap,
      this.bottomDivider = true,
      this.rigthArrow = true,
      this.titleUnderline = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      decoration:
                          titleUnderline ? TextDecoration.underline : null),
                ),
                rigthArrow
                    ? const Icon(Icons.arrow_forward_ios_rounded, size: 22)
                    : const SizedBox(),
              ],
            ),
            if (bottomDivider) const SizedBox(height: 20),
            if (bottomDivider)
              Divider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.onSecondary)
          ],
        ),
      ),
    );
  }
}
