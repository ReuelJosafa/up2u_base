import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  const CustomAppBar(
      {Key? key,
      required this.child,
      this.height = kToolbarHeight,
      this.bottomLeftRadius = 0.0,
      this.bottomRightRadius = 0.0})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(blurRadius: 1)],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeftRadius),
            bottomRight: Radius.circular(bottomRightRadius)),
        color: Theme.of(context).primaryColor,
      ),
      height: preferredSize.height,
      alignment: Alignment.center,
      child: child,
    );
  }
}
