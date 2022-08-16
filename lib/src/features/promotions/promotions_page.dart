import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:up2u_base/src/shared/components/custom_app_bar_widget.dart';

import '../../shared/components/custom_expansion_tile_wiget.dart';
import '../../shared/components/custom_text_form_field_widget.dart';

class PromotionsPage extends StatefulWidget {
  const PromotionsPage({Key? key}) : super(key: key);

  @override
  State<PromotionsPage> createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomExpansionTile(
                title: 'Adicionar Promoção',
                isExpanded: isExpanded,
                onExpansionChanged: (value) {
                  setState(() {
                    isExpanded = value;
                  });
                },
                children: [
                  //TODO: Adicionar controller neste widget
                  const CustomTextFormField(
                      title: 'Nome', hintText: 'Lorem ipsum exemplo'),
                  const CustomTextFormField(
                      title: 'Inicio', hintText: 'Lorem ipsum exemplo'),
                  const CustomTextFormField(
                      title: 'Termino', hintText: 'Lorem ipsum exemplo'),
                  const CustomTextFormField(
                      title: 'Data', hintText: 'Lorem ipsum exemplo'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.w300),
                        fixedSize: const Size(double.maxFinite, 37),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Adicionar'),
                    ),
                  ),
                ],
              ),
              /* _customAnimatedContainer(
                  expanded: isExpanded,
                  onExpanded: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  }), */
              _customContainerActions(),
            ],
          ),
        ),
      ),
    );
  }

/*   Widget _customAnimatedContainer(
      {bool expanded = false, void Function()? onExpanded}) {
    return AnimatedContainer(
      height: expanded ? 230 : 60,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onExpanded,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Adicionar Promoção',
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Icon(expanded
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
          if (expanded)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  } */

  Widget _customContainerActions() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Promoção 1',
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  '27/02 dás 19h á 02h',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 8),
                Text(
                  'Ativado',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          Switch(value: true, onChanged: (value) {})
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return CustomAppBar(
      bottomRightRadius: 30,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                    const SizedBox(width: 32),
                    Text(
                      'Promoções',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 56),
                  child: Text(
                    'Adicione uma nova promoção em seu estabelecimento',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
