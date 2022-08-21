import 'package:flutter/material.dart';

class InicialSubpage extends StatefulWidget {
  const InicialSubpage({Key? key}) : super(key: key);

  @override
  State<InicialSubpage> createState() => _InicialSubpageState();
}

class _InicialSubpageState extends State<InicialSubpage> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32, top: 16),
        child: Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          trackVisibility: true,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return _buildPartyInfoContainer();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPartyInfoContainer() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      padding: const EdgeInsets.all(16),
      height: 296,
      width: 333,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerPartyInfo(),
          const SizedBox(height: 22),
          Expanded(child: _bodyPartyInfo()),
          _footerPartyInfo()
        ],
      ),
    );
  }

  Widget _headerPartyInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              const TextSpan(
                children: [
                  TextSpan(text: 'QUINTA-FEIRA'),
                  TextSpan(text: '\n'),
                  TextSpan(text: '01/01/2024'),
                ],
              ),
              maxLines: 2,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            /*  Text(
              'QUINTA-FEIRA',
            ),
            Text('01/01/2024'), */
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Editar Card',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(decoration: TextDecoration.underline)),
            const SizedBox(width: 6),
            const Icon(Icons.edit, size: 18)
          ],
        )
      ],
    );
  }

  Widget _bodyPartyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lorem ipsum ',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.w500)),
        Text('Evento : A volta dos que não foram',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w300)),
        Text('A partir de 21:00 às 04:00',
            style: Theme.of(context).textTheme.headline4),
        Text('Entrada R\$25,00', style: Theme.of(context).textTheme.headline4),
      ],
    );
  }

  Widget _footerPartyInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
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
        Text.rich(
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
      ],
    );
  }
}
