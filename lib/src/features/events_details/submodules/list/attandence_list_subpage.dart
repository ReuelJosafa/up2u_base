import 'package:flutter/material.dart';

import '../../../../shared/components/alert_dialog_action_button_widget.dart';
import '../../../../shared/components/custom_checkbox_tile_widget.dart';
import 'models/person_presence.dart';

class AttandenceListSubpage extends StatefulWidget {
  const AttandenceListSubpage({Key? key}) : super(key: key);

  @override
  State<AttandenceListSubpage> createState() => _AttandenceListSubpageState();
}

class _AttandenceListSubpageState extends State<AttandenceListSubpage> {
  final date = '15/06';

  List<PersonPresence> presenceList = List.generate(
      30,
      (index) => PersonPresence(
          name: 'lorem ipsum Exemplo $index',
          present: index != 1,
          email: 'Loremipsum$index@gmail.com',
          phone: '00000-0000'));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22, bottom: 16, top: 28),
          child: Text(
            date,
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
            itemCount: presenceList.length,
            itemBuilder: (context, index) {
              return _buildAttandanceListTile(
                  name: presenceList[index].name,
                  isPresent: presenceList[index].present,
                  onTap: () => _editPreseceAlertDialog(
                        presenceList[index],
                        onChanged: () => setState(() {
                          presenceList[index].present =
                              !presenceList[index].present;
                        }),
                      ));
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

  void _editPreseceAlertDialog(PersonPresence personPresence,
      {void Function()? onChanged}) {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: colorScheme.onBackground,
            title: Text('Confirmar presença de ${personPresence.name}?'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTitleAndSubtitle(
                      title: 'Nome', subtitle: personPresence.name),
                  _buildTitleAndSubtitle(
                      title: 'Email', subtitle: personPresence.email),
                  _buildTitleAndSubtitle(
                      title: 'Telefone', subtitle: personPresence.phone),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return CustomCheckboxTile(
                        title: personPresence.present ? 'Presente' : 'Ausente',
                        style: Theme.of(context)
                            .dialogTheme
                            .contentTextStyle!
                            .copyWith(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF696969)),
                        value: personPresence.present,
                        onChanged: (value) {
                          setState(onChanged!);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              //TODO: Revisar quando o usuário quiser salvar ou não a alteração.

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
