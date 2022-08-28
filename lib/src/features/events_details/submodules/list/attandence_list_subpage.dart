import 'package:flutter/material.dart';

import '../../../../shared/components/alert_dialog_action_button_widget.dart';
import '../../../../shared/components/custom_checkbox_tile_widget.dart';

class AttandenceListSubpage extends StatefulWidget {
  const AttandenceListSubpage({Key? key}) : super(key: key);

  @override
  State<AttandenceListSubpage> createState() => _AttandenceListSubpageState();
}

class _AttandenceListSubpageState extends State<AttandenceListSubpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22, bottom: 16, top: 28),
          child: Text(
            '15/06',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w300),
          ),
        ),
        Expanded(
          child: ListView.builder(
            
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: 30,
            itemBuilder: (context, index) {
              return _buildAttandanceListTile(
                  name: 'lorem ipsum Exemplo',
                  isPresent: index != 1,
                  onTap: _editPreseceAlertDialog);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAttandanceListTile(
      {required String name, required bool isPresent, void Function()? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          trailing: Container(
            alignment: Alignment.center,
            width: 90,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color:
                  isPresent ? const Color(0xFFFBBC05) : const Color(0xFFE83E3E),
            ),
            child: Text(
              isPresent ? 'Presente' : 'Ausente',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w300, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  void _editPreseceAlertDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: colorScheme.onBackground,
            title: const Text('Confirmar presença de Lorem ipsum?'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTitleAndSubtitle(
                      title: 'Nome', subtitle: 'Lorem ipsum'),
                  _buildTitleAndSubtitle(
                      title: 'Email', subtitle: 'Loremipsum@gmail.com'),
                  _buildTitleAndSubtitle(
                      title: 'Telefone', subtitle: '00000-0000'),
                  CustomCheckboxTile(
                    title: 'Presente',
                    style: Theme.of(context)
                        .dialogTheme
                        .contentTextStyle!
                        .copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF696969)),
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              AlertDialogActionButton(
                  onPressed: () => Navigator.pop(context),
                  title: 'Voltar',
                  outlineBorder: true),
              AlertDialogActionButton(
                  onPressed: () {}, title: 'Salvar', filled: true),
            ],
          );
        }));
  }

  Widget _buildTitleAndSubtitle(
      {required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).dialogTheme.contentTextStyle!.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.5)),
        ),
        const SizedBox(height: 8),
        Text(subtitle,
            style: Theme.of(context).dialogTheme.contentTextStyle!.copyWith(
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(0.5))),
        const SizedBox(height: 8),
      ],
    );
  }
}
