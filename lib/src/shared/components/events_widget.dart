import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constant_app_images.dart';

class EventsWidget extends StatelessWidget {
  final void Function()? onTap;
  final bool administrator;
  final bool? favorite;
  final bool promotion;
  final void Function()? onFavorite;
  const EventsWidget(
      {Key? key,
      required this.onTap,
      this.administrator = false,
      this.favorite,
      this.onFavorite,
      this.promotion = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 27),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        height: 204,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 12, top: 4, right: 10, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (administrator) const SizedBox(height: 4),
                      Text('Exemplo',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text('Rua exemplo',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.w300)),
                      ),
                      if (administrator) const SizedBox(height: 4),
                    ],
                  ),
                  if (!administrator)
                    IconButton(
                      onPressed: onFavorite,
                      icon: favorite!
                          ? SvgPicture.asset(ConstantAppImages.heartFilled)
                          : SvgPicture.asset(ConstantAppImages.heart),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'images/rectangle8.jpg',
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, top: 4, right: 12, bottom: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Balala',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w700)),
                  if (!administrator)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: promotion
                            ? Theme.of(context).colorScheme.secondary
                            : const Color(0xFF937729).withOpacity(0.43),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(12, 2, 6, 4),
                            width: 15,
                            height: 15,
                            child: Image.asset(ConstantAppImages.megaphone,
                                fit: BoxFit.fill),
                          ),
                          Text('PROMOÇÃO',
                              style: Theme.of(context).textTheme.bodyText2),
                          const SizedBox(width: 12)
                        ],
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
