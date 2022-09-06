import 'package:flutter/material.dart';

class CustomOutlineSearch extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const CustomOutlineSearch({Key? key, this.controller, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.headline4!.copyWith(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w300),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: Container(
          width: 53,
          height: 43,
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(10)),
              color: Theme.of(context).colorScheme.secondary),
          child: const Icon(
            Icons.search,
            color: Colors.white,
            size: 24,
          ),
        ),
        isDense: true,
        contentPadding:
            const EdgeInsets.only(left: 22, bottom: 10, top: 12, right: 10),
        hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w300),
        hintText: 'Pesquisar...',
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
