import 'package:flutter/material.dart';

class OutlineSearchField extends TextField {
  OutlineSearchField(
    BuildContext context, {
    Key? key,
    TextEditingController? controller,
    Function(String)? onChanged,
  }) : super(
          key: key,
          controller: controller,
          onChanged: onChanged,
          style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w300),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              size: 22,
              color: Theme.of(context).colorScheme.secondary,
            ),
            suffixIconConstraints: const BoxConstraints(
                maxHeight: 50, minHeight: 36, minWidth: 36),
            isDense: true,
            contentPadding:
                const EdgeInsets.only(left: 16, bottom: 0, top: 0, right: 10),
            hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w300),
            hintText: 'Pesquisar...',
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        );
}
