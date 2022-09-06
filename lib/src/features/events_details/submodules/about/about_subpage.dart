import 'package:flutter/material.dart';

import '../../../../shared/components/text_underlined_button_widget.dart';

class AboutSubpage extends StatefulWidget {
  final bool isAnAdministrator;
  const AboutSubpage({Key? key, required this.isAnAdministrator})
      : super(key: key);

  @override
  State<AboutSubpage> createState() => _AboutSubpageState();
}

class _AboutSubpageState extends State<AboutSubpage> {
  final contacts = [
    '(00) 00000-0000',
    '(00) 00000-0000',
  ];
  final text = 'Lorem ipsum dolor sit amet consectetur adipiscing elit erat,'
      'finibus ridiculus augue accumsan parturient mauris nulla, cursus purus mi quam proin interdum eros';

  void _onTap() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            textAlign: TextAlign.justify,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 24),
          Text('Contatos:', style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 8),
          for (var contact in contacts) contactsTile(phone: contact),
          if (widget.isAnAdministrator)
            Align(
                alignment: Alignment.centerRight,
                child: TextUnderlinedButton(
                  onTap: _onTap,
                  title: 'Editar sobre',
                )),
        ],
      ),
    );
  }

  Widget contactsTile({required String phone}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text.rich(
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.start,
        TextSpan(
          style: Theme.of(context).textTheme.headline4,
          children: [
            const WidgetSpan(child: Icon(Icons.whatsapp, size: 20)),
            const WidgetSpan(child: SizedBox(width: 8, height: 8)),
            TextSpan(text: phone)
          ],
        ),
      ),
    );
  }
}
