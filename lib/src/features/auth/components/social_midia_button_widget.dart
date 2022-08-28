import 'package:flutter/material.dart';

class SocialMidiaButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color? color;
  final bool textSameColor;
  final void Function()? onTap;
  const SocialMidiaButton(
      {Key? key,
      required this.icon,
      required this.text,
      this.color,
      this.textSameColor = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: InkWell(
          onTap: onTap,
          child: Text.rich(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            TextSpan(
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: textSameColor ? color : null),
              children: [
                WidgetSpan(child: icon),
                const WidgetSpan(child: SizedBox(width: 8, height: 8)),
                TextSpan(
                    text: text,
                    style:
                        const TextStyle(decoration: TextDecoration.underline))
              ],
            ),
          ),
        ));
  }
}
