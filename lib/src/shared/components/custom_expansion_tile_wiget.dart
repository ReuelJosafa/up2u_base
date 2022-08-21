import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final void Function(bool)? onExpansionChanged;
  final List<Widget> children;

  const CustomExpansionTile(
      {Key? key,
      required this.title,
      this.isExpanded = false,
      this.onExpansionChanged,
      this.children = const <Widget>[]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    children.length;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          maxLines: 2,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        initiallyExpanded: isExpanded,
        trailing: Icon(
            isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down_sharp,
            color: Colors.white),
        expandedAlignment: Alignment.centerLeft,
        onExpansionChanged: onExpansionChanged,
        children: children,
      ),
    );
  }
}
