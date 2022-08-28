import 'package:flutter/material.dart';

import '../../shared/components/commom_app_bar_widget.dart';
import '../../shared/components/custom_checkbox_tile_widget.dart';
import '../../shared/components/custom_container_action_widget.dart';
import '../../shared/components/custom_expansion_tile_wiget.dart';
import '../../shared/components/commom_text_form_field_widget.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final formKey = GlobalKey<FormState>();
  bool isExpanded = false;

  void _addUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommomAppBar(
        title: 'Usuários',
        subtitle: 'Adicione ou modifique o nível de acesso dos seus usuários',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: CustomExpansionTile(
                title: 'Adicionar Usuário',
                isExpanded: isExpanded,
                onExpansionChanged: (value) {
                  setState(() {
                    isExpanded = value;
                  });
                },
                children: [
                  const CommmomTextFormField(
                      title: 'Nome', hintText: 'Lorem ipsum Silva'),
                  const CommmomTextFormField(
                      title: 'Cargo', hintText: 'Lorem ipsum exemplo'),
                  const CommmomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      title: 'E-mail',
                      hintText: 'Fulano@gmail.com'),
                  const CommmomTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      title: 'Senha',
                      hintText: '***********'),
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
                            title: 'Cardápio',
                            value: false,
                            onChanged: (value) {},
                          ),
                          CustomCheckboxTile(
                            title: 'Edição de usuários',
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
                      onPressed: _addUser,
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
            ),
            ListView.builder(
                shrinkWrap: true,
                physics:
                    const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomContainerAction(
                      title: 'André Mineiro $index',
                      subtitle: 'Barman',
                      thirdtitle: 'Permissões: Cardápio',
                      trailing: const Icon(Icons.arrow_forward_ios_rounded));
                }),
          ],
        ),
      ),
    );
  }
}
