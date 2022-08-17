import 'package:flutter/material.dart';

class CustomContainerAction extends StatelessWidget {
  final String title;
  final String subtitle;
  final String thirdtitle;
  final Widget trailing;

  const CustomContainerAction(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.trailing,
      required this.thirdtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 8),
                Text(
                  thirdtitle,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
