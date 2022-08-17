import 'package:flutter/material.dart';

import '../../../../shared/components/text_underlined_button_widget.dart';

class AboutSubpage extends StatelessWidget {
  const AboutSubpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lorem ipsum dolor sit amet consectetur adipiscing elit erat,'
            'finibus ridiculus augue accumsan parturient mauris nulla, cursus purus mi quam proin interdum eros',
            textAlign: TextAlign.justify,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 24),
          Text(
            'Contatos:',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 8),
          Text.rich(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.start,
            TextSpan(
              style: Theme.of(context).textTheme.headline4,
              children: const [
                WidgetSpan(child: Icon(Icons.whatsapp, size: 20)),
                WidgetSpan(child: SizedBox(width: 8, height: 8)),
                TextSpan(text: '119454693')
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text.rich(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.start,
            TextSpan(
              style: Theme.of(context).textTheme.headline4,
              children: const [
                WidgetSpan(child: Icon(Icons.whatsapp, size: 20)),
                WidgetSpan(child: SizedBox(width: 8, height: 8)),
                TextSpan(text: '119454693')
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextUnderlinedButton(
                onTap: () {},
                title: 'Editar sobre',
              )),
        ],
      ),
    );
  }
}
