import 'package:flutter/material.dart';

class AlertDialogActionButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool filled;
  final bool outlineBorder;
  final String title;
  final Widget? child;
  const AlertDialogActionButton(
      {Key? key,
      this.onPressed,
      this.filled = false,
      this.outlineBorder = false,
      required this.title,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            fixedSize: const Size(118, 28),
            backgroundColor: filled ? Theme.of(context).primaryColor : null,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            side: outlineBorder
                ? BorderSide(color: Theme.of(context).primaryColor, width: 1)
                : null),
        child: child ??
            Text(title,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: filled
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300)));
  }
}
