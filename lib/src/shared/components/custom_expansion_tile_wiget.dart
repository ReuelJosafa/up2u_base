import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final bool inverseTrailing;
  final void Function(bool)? onExpansionChanged;
  final List<Widget> children;

  const CustomExpansionTile(
      {Key? key,
      required this.title,
      this.isExpanded = false,
      this.onExpansionChanged,
      this.children = const <Widget>[],
      this.inverseTrailing = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData _trailing() {
      if (inverseTrailing) {
        return isExpanded ? Icons.arrow_drop_down_sharp : Icons.arrow_drop_up;
      }
      return isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down_sharp;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: ExpansionTile(
        key: key,
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
        trailing: Icon(_trailing(), color: Colors.white),
        expandedAlignment: Alignment.centerLeft,
        onExpansionChanged: onExpansionChanged,
        children: children,
      ),
    );
  }
}
