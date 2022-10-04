import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up2u_base/src/features/events_details/submodules/menu/model/menu.dart';
import 'package:up2u_base/src/shared/components/commom_app_bar_widget.dart';

import '../../../../shared/components/alert_dialog_action_button_widget.dart';
import '../../../../shared/components/custom_expansion_tile_wiget.dart';
import '../../../../shared/components/commom_text_form_field_widget.dart';
import '../../../../shared/constants/app_images.dart';

class EditMenuPage extends StatefulWidget {
  final Menu menu;
  const EditMenuPage({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  State<EditMenuPage> createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenuPage> {
  bool _isExpanded = false;
  String _newItemTitle = '';
  late Menu _menu;

  @override
  void initState() {
    super.initState();
    _menu = widget.menu;
  }

  void _onNewItemTitleChanged(String newValue) => _newItemTitle = newValue;

  void _onAddItem() {
    // TODO: Implementar a função que é utlizada pelo menu expansivo para adicionar um item ao cardápio.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommomAppBar(
          title: 'Cardápio',
          subtitle: 'Adicione ou modifique o cardápio do seu estabeleciemento'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _buildMenuTitle(),
            const SizedBox(height: 28),
            _buildItensList(),
            _buildExpandableAddMenu()
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTitle() {
    return Text(
      _menu.title,
      style: Theme.of(context)
          .textTheme
          .headline2!
          .copyWith(fontWeight: FontWeight.w500),
    );
  }

  Widget _buildItensList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _menu.list.length,
        itemBuilder: (context, index) {
          return _buildListTile(_menu.list[index]);
        },
      ),
    );
  }

  Widget _buildListTile(String title) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    Text(
      title,
      style: textTheme.headline4!
          .copyWith(color: colorScheme.surface, fontWeight: FontWeight.w600),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500)),
          GestureDetector(
              onTap: () => _showCommomDialog(
                  title: title, actionType: ActionType.delete),
              child: SvgPicture.asset(AppImages.deleteAlt,
                  fit: BoxFit.scaleDown)),
        ],
      ),
    );
  }

  Widget _buildExpandableAddMenu() {
    return CustomExpansionTile(
      title: 'Adicionar',
      isExpanded: _isExpanded,
      inverseTrailing: true,
      onExpansionChanged: (value) => setState(() {
        _isExpanded = value;
      }),
      children: [
        CommmomTextFormField(
            title: 'Nome',
            hintText: 'Lorem ipsum exemplo',
            onChanged: _onNewItemTitleChanged),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () => _showCommomDialog(
                title: _newItemTitle,
                actionType: ActionType.add,
                onPressed: _onAddItem),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              textStyle: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w300),
              fixedSize: const Size(double.maxFinite, 37),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Adicionar'),
          ),
        ),
      ],
    );
  }

  void _showCommomDialog(
      {required String title,
      required ActionType actionType,
      void Function()? onPressed}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: colorScheme.onBackground,
            title: Text.rich(
              style: textTheme.headline4!.copyWith(
                  color: colorScheme.surface, fontWeight: FontWeight.w500),
              TextSpan(
                  text:
                      'Você tem certeza que deseja ${actionType.title.toUpperCase()} o item ',
                  children: [
                    TextSpan(
                      text: title,
                      style: textTheme.headline4!.copyWith(
                          color: colorScheme.surface,
                          fontWeight: FontWeight.w900),
                    ),
                    const TextSpan(text: '?'),
                  ]),
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              AlertDialogActionButton(
                  onPressed: () => Navigator.pop(context),
                  title: 'Voltar',
                  outlineBorder: true),
              const SizedBox(width: 8),
              AlertDialogActionButton(
                  onPressed: onPressed, title: actionType.title, filled: true),
            ],
          );
        }));
  }
}

enum ActionType {
  add(title: 'Adicionar'),
  delete(title: 'Excluir');

  const ActionType({required this.title});
  final String title;
}
