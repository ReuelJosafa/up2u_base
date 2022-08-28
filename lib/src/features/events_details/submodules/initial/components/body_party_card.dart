import 'package:flutter/material.dart';

class BodyPartyCard extends StatelessWidget {
  final String title;
  final String eventName;
  final String schedule;
  final String entryValue;
  const BodyPartyCard(
      {Key? key,
      required this.title,
      required this.eventName,
      required this.schedule,
      required this.entryValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.w500)),
        Text('Evento: $eventName',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w300)),
        Text(schedule, style: Theme.of(context).textTheme.headline4),
        Text(entryValue, style: Theme.of(context).textTheme.headline4),
      ],
    );
  }
}
