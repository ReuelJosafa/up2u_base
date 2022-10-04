import 'package:flutter/material.dart';

import '../utils/components_utils.dart';

class CommomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final double height;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  const CommomAppBar(
      {Key? key,
      this.height = 130,
      this.bottomLeftRadius = 0.0,
      // this.bottomRightRadius = 30,
      this.bottomRightRadius = 0.0,
      required this.title,
      required this.subtitle})
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
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    ComponentsUtils.buildArrowBack(context),
                    const SizedBox(width: 32),
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 56),
                  child: Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
