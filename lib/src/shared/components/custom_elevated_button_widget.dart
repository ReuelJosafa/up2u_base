import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomElevatedButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          textStyle: Theme.of(context).textTheme.button,
          fixedSize: const Size.fromHeight(57),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
