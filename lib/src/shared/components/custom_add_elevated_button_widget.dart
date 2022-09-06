import 'package:flutter/material.dart';

class CustomAddElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomAddElevatedButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          textStyle: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.w300),
          fixedSize: const Size(double.maxFinite, 37),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Adicionar'),
      ),
    );
  }
}
