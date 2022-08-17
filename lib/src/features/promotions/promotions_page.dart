import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:up2u_base/src/shared/components/custom_app_bar_widget.dart';

import '../../shared/components/custom_container_action_widget.dart';
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
              CustomContainerAction(
                  title: 'Promoção 1',
                  subtitle: '27/02 dás 19h á 02h',
                  thirdtitle: 'Ativado',
                  trailing: Switch(value: true, onChanged: (value) {})),
              CustomContainerAction(
                  title: 'Promoção 1',
                  subtitle: '27/02 dás 19h á 02h',
                  thirdtitle: 'Ativado',
                  trailing: Switch(value: true, onChanged: (value) {})),
            ],
          ),
        ),
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
