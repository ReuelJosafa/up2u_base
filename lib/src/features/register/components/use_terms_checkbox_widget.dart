import 'package:flutter/material.dart';

import '../../../shared/components/custom_checkbox_widget.dart';

class UseTermsCheckbox extends StatelessWidget {
  final void Function()? onPressed;
  final bool checkboxValue;
  const UseTermsCheckbox(
      {Key? key, this.onPressed, required this.checkboxValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomCheckbox(
          value: checkboxValue,
          onChanged: (value) {},
        ),
        const SizedBox(width: 14),
        Text('Aceitar os',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w500)),
        TextButton(
          onPressed: onPressed,
          child: Text('Termos de uso',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  )),
        )
      ],
    );
  }
}
