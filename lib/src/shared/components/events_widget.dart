import 'package:flutter/material.dart';

class EventsWidget extends StatelessWidget {
  final void Function()? onTap;
  const EventsWidget({Key? key, required this.onTap}) : super(key: key);

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
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    //TODO: Substituir por ícone do Figma
                    icon: const Icon(Icons.favorite_border),
                  )
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 12, right: 4, top: 2, bottom: 1),
                          child: Icon(Icons.campaign_outlined, size: 18),
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
