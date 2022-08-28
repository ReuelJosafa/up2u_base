import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final TextStyle style;
  final List<String> menuItems;
  final String? selectedValue;
  final Function(String?)? onChanged;
  const CustomDropdownButton(
      {Key? key,
      required this.style,
      required this.menuItems,
      this.selectedValue,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        iconEnabledColor: const Color(0xFF0D0D0D),
        dropdownDecoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        selectedItemHighlightColor:
            Theme.of(context).primaryColor.withOpacity(0.5),
        style: style,
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black26,
          ),
        ),
        hint: Text('Selecionar', style: style),
        value: selectedValue,
        onChanged: onChanged,
        buttonPadding: const EdgeInsets.symmetric(horizontal: 8),
        dropdownPadding: EdgeInsets.zero,
        isExpanded: true,
        buttonHeight: 28,
        // buttonWidth: 150,
        items: menuItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: style,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
