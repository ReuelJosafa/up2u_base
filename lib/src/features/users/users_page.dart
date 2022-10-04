import 'package:flutter/material.dart';
import 'package:up2u_base/src/features/users/controllers/add_user_controller.dart';

import '../../shared/components/commom_app_bar_widget.dart';
import '../../shared/components/custom_add_elevated_button_widget.dart';
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
  final controller = AddUserController();

  void _onSubmit() {
    bool isValidated = formKey.currentState?.validate() ?? false;
    if (!isValidated) {
      return;
    }

    controller.addUser();
  }

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
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    return CustomExpansionTile(
                      key: controller.expansionTileKey,
                      title: 'Adicionar Usuário',
                      isExpanded: controller.isExpanded,
                      onExpansionChanged: (value) {
                        controller.toggleExpanded();
                      },
                      children: [
                        CommmomTextFormField(
                            onChanged: controller.onChangeName,
                            validator: controller.onValidator,
                            title: 'Nome',
                            hintText: 'Lorem ipsum Silva'),
                        CommmomTextFormField(
                            onChanged: controller.onChangeJob,
                            validator: controller.onValidator,
                            title: 'Cargo',
                            hintText: 'Lorem ipsum exemplo'),
                        CommmomTextFormField(
                            onChanged: controller.onChangeEmail,
                            validator: controller.onValidator,
                            keyboardType: TextInputType.emailAddress,
                            title: 'E-mail',
                            hintText: 'Fulano@gmail.com'),
                        CommmomTextFormField(
                            onChanged: controller.onChangePassword,
                            validator: controller.onValidator,
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
                                  value: controller.canAccessCard,
                                  onChanged: (value) {
                                    controller.toggleCardAccess();
                                  },
                                ),
                                CustomCheckboxTile(
                                  title: 'Listas',
                                  value: controller.canAccessLists,
                                  onChanged: (value) {
                                    controller.toggleListsAccess();
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCheckboxTile(
                                  title: 'Cardápio',
                                  value: controller.canAccessMenu,
                                  onChanged: (value) {
                                    controller.toggleMenuAccess();
                                  },
                                ),
                                CustomCheckboxTile(
                                  title: 'Edição de usuários',
                                  value: controller.canEditUser,
                                  onChanged: (value) {
                                    controller.toggleEditUser();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CustomAddElevatedButton(onPressed: () {
                          _onSubmit();
                        }),
                      ],
                    );
                  }),
            ),
            AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(
                          parent: NeverScrollableScrollPhysics()),
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        final user = controller.users[index];
                        return CustomContainerAction(
                            title: user.name,
                            subtitle: user.job,
                            thirdtitle:
                                'Permissões: ${user.permissionsAsString}',
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded));
                      });
                }),
          ],
        ),
      ),
    );
  }
}
