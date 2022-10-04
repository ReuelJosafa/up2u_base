import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_images.dart';
import '../models/local_of_event.dart';

class EventsWidget extends StatelessWidget {
  final void Function()? onTap;
  final bool administrator;
  final LocalOfEvent localOfEvent;

  final void Function()? onFavorite;
  const EventsWidget(
      {Key? key,
      required this.onTap,
      this.administrator = false,
      required this.localOfEvent,
      this.onFavorite})
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
                      Text(localOfEvent.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(localOfEvent.address,
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
                      icon: localOfEvent.favorite
                          ? SvgPicture.asset(AppImages.heartFilled)
                          : SvgPicture.asset(AppImages.heart),
                    ),
                ],
              ),
            ),
            Expanded(
              //TODO: Modificar para receber imagem via Url.
              child: Image.asset(
                localOfEvent.imageUrl,
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
                  Text(localOfEvent.type,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w700)),
                  if (!administrator && localOfEvent.promotion)
                    _buildPromotionTile(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPromotionTile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(12, 2, 6, 4),
            width: 15,
            height: 15,
            child: Image.asset(AppImages.megaphone, fit: BoxFit.fill),
          ),
          Text('PROMOÇÃO', style: Theme.of(context).textTheme.bodyText2),
          const SizedBox(width: 12)
        ],
      ),
    );
  }
}
