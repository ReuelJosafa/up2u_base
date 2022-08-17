import 'package:flutter/material.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_checkbox_widget.dart';
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
      appBar: _appBar(),
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
                          _buildCheckboxTile(
                            title: 'Card',
                            onChanged: (value) {},
                          ),
                          _buildCheckboxTile(
                            title: 'Listas',
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCheckboxTile(
                            title: 'Cardapio',
                            onChanged: (value) {},
                          ),
                          _buildCheckboxTile(
                            title: 'Edição de usuarios',
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
                      'Usuários',
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
                    'Adicione ou modifique o nivel de acesso dos seus funcionarios',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget _buildCheckboxTile(
      {required String title, required void Function(bool?)? onChanged}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCheckbox(
          value: true,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}
