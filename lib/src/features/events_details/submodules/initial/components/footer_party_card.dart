import 'package:flutter/material.dart';

class FooterPartyInfo extends StatelessWidget {
  final void Function()? onAddName;
  final void Function()? onMoreInfos;
  final bool isAnUser;

  const FooterPartyInfo(
      {Key? key, this.onAddName, this.onMoreInfos, this.isAnUser = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(isAnUser)
        InkWell(
          onTap: onAddName,
          child: Text.rich(
            maxLines: 2,
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                const WidgetSpan(child: Icon(Icons.add, size: 14)),
                const WidgetSpan(child: SizedBox(width: 6, height: 6)),
                TextSpan(
                    text: 'ADICIONAR NOME',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).primaryColor)),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: onMoreInfos,
          child: Text.rich(
            maxLines: 2,
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                const WidgetSpan(child: Icon(Icons.add, size: 14)),
                const WidgetSpan(child: SizedBox(width: 4, height: 4)),
                TextSpan(
                    text: 'Mais Infos',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(decoration: TextDecoration.underline)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
