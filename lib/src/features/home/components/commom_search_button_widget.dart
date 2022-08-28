import 'package:flutter/material.dart';

class CommomSearchButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CommomSearchButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
          elevation: 0,
          textStyle: Theme.of(context).textTheme.bodyText1,
          fixedSize: const Size.fromHeight(23),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
