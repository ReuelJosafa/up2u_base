import 'package:flutter/material.dart';

import '../../shared/components/commom_app_bar_widget.dart';
import '../../shared/components/custom_checkbox_tile_widget.dart';
import '../../shared/components/custom_container_action_widget.dart';
import '../../shared/components/custom_expansion_tile_wiget.dart';
import '../../shared/components/custom_text_form_field_widget.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommomAppBar(
        title: 'Usuários',
        subtitle:
            'Adicione ou modifique o nivel de acesso dos seus funcionarios',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomExpansionTile(
                title: 'Adicionar Funcionário',
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
                      title: 'Cargo', hintText: 'Lorem ipsum exemplo'),
                  const CustomTextFormField(
                      title: 'Email', hintText: 'Lorem ipsum exemplo'),
                  const CustomTextFormField(
                      title: 'Senha', hintText: '***********'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCheckboxTile(
                            title: 'Card',
                            value: false,
                            onChanged: (value) {},
                          ),
                          CustomCheckboxTile(
                            title: 'Listas',
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCheckboxTile(
                            title: 'Cardapio',
                            value: false,
                            onChanged: (value) {},
                          ),
                          CustomCheckboxTile(
                            title: 'Edição de usuarios',
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
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
              const CustomContainerAction(
                  title: 'André Mineiro',
                  subtitle: 'Barman',
                  thirdtitle: 'Permissões: Cardapio',
                  trailing: Icon(Icons.arrow_forward_ios_rounded)),
              const CustomContainerAction(
                  title: 'André Mineiro',
                  subtitle: 'Barman',
                  thirdtitle: 'Permissões: Cardapio',
                  trailing: Icon(Icons.arrow_forward_ios_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
