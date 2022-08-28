import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../shared/constants/constant_app_images.dart';

class HeaderPartyCard extends StatelessWidget {
  final bool isAnAdministrator;
  final String weekDay;
  final String date;
  final void Function()? onEditCard;
  const HeaderPartyCard(
      {Key? key,
      required this.isAnAdministrator,
      required this.weekDay,
      required this.date,
      this.onEditCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: weekDay),
                  const TextSpan(text: '\n'),
                  TextSpan(text: date),
                ],
              ),
              maxLines: 2,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        if (isAnAdministrator)
          InkWell(
            onTap: onEditCard,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Editar Card',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(decoration: TextDecoration.underline)),
                const SizedBox(width: 6),
                SvgPicture.asset(
                  ConstantAppImages.editAlt,
                  fit: BoxFit.scaleDown,
                  color: Colors.white.withOpacity(0.56),
                )
              ],
            ),
          )
      ],
    );
  }
}
