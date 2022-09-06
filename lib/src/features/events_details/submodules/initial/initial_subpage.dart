import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../shared/components/alert_dialog_action_button_widget.dart';
import '../../../../shared/components/commom_text_form_field_widget.dart';
import '../../../../shared/components/custom_close_button_widget.dart';
import '../../../../shared/utils/date_time_utils.dart';
import '../../../../shared/utils/formmater_money.dart';
import 'components/body_party_card.dart';
import 'components/footer_party_card.dart';
import 'components/header_party_card.dart';

class InicialSubpage extends StatefulWidget {
  final bool isAnAdministrator;
  final String partyName;
  final String address;
  const InicialSubpage(
      {Key? key,
      required this.isAnAdministrator,
      required this.partyName,
      required this.address})
      : super(key: key);

  @override
  State<InicialSubpage> createState() => _InicialSubpageState();
}

class _InicialSubpageState extends State<InicialSubpage> {
  final ScrollController scrollController = ScrollController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();

    dateController.text = '';
  }

  Future<void> _onChooseData() async {
    await DateTimeUtils.chooseData(
      context,
      initialDate: _date,
      onDateChanged: (newDate) {
        _date = newDate;
        String formattedDate = DateFormat('dd/MM/yyyy').format(_date);
        setState(() {
          dateController.text = formattedDate;
        });
      },
    );
  }

  Future<void> _onChooseStartTime() async {
    await DateTimeUtils.chooseTime(
      context,
      timeOfDay: _startTime,
      onTimeChanged: (newTime) {
        setState(() {
          _startTime = newTime;
          startTimeController.text =
              DateTimeUtils.toPtBrFormat(context, _startTime);
        });
      },
    );
  }

  Future<void> _onChooseEndTime() async {
    await DateTimeUtils.chooseTime(
      context,
      timeOfDay: _endTime,
      onTimeChanged: (newTime) {
        setState(() {
          _endTime = newTime;
          endTimeController.text =
              DateTimeUtils.toPtBrFormat(context, _endTime);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          HeaderPartyCard(
            isAnAdministrator: widget.isAnAdministrator,
            weekDay: 'QUINTA-FEIRA',
            date: '01/01/2024',
            onEditCard: _showEditPartyDialog,
          ),
          const SizedBox(height: 22),
          const Expanded(
              child: BodyPartyCard(
            title: 'Lorem ipsum',
            eventName: 'A volta dos que não foram',
            schedule: 'A partir das 21:00 às 04:00',
            entryValue: 'Entrada R\$25,00',
          )),
          FooterPartyInfo(
            isAnUser: !widget.isAnAdministrator,
            onAddName: () {},
            onMoreInfos: () {},
          )
        ],
      ),
    );
  }

  void _showEditPartyDialog() {
    final ThemeData theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            titlePadding: const EdgeInsets.all(0),
            title: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 44, 24, 0),
                  child: Column(
                    children: [
                      Text(widget.partyName,
                          style: textTheme.headline5!.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w700)),
                      Text(widget.address,
                          style: textTheme.headline4!.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                const Positioned(top: 2, right: 2, child: CustomCloseButton()),
              ],
            ),
            backgroundColor: colorScheme.onBackground,
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCommomTextFormField(
                      title: 'Nome do Evento', hintText: 'Lorem ipsum'),
                  _buildCommomTextFormField(
                      controller: startTimeController,
                      onTap: _onChooseStartTime,
                      readOnly: true,
                      title: 'Horário de início',
                      hintText: '00h00'),
                  _buildCommomTextFormField(
                      controller: endTimeController,
                      onTap: _onChooseEndTime,
                      readOnly: true,
                      title: 'Horário de término',
                      hintText: '00h00'),
                  _buildCommomTextFormField(
                      controller: dateController,
                      onTap: _onChooseData,
                      readOnly: true,
                      title: 'Data',
                      hintText: '00/00/00'),
                  _buildCommomTextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CurrencyPtBrInputFormatter()
                      ],
                      keyboardType: TextInputType.number,
                      title: 'Entrada',
                      hintText: 'R\$ 00,00'),
                  _buildCommomTextFormField(
                      title: 'Descrição', hintText: 'Lorem ipsum exemplo'),
                ],
              ),
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              AlertDialogActionButton(
                  onPressed: () {}, title: 'Salvar', filled: true),
            ],
          );
        }));
  }

  Widget _buildCommomTextFormField({
    required String title,
    required String hintText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    void Function(String)? onChanged,
    void Function()? onTap,
    bool readOnly = false,
  }) {
    final ThemeData theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return CommmomTextFormField(
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: inputFormatters,
      title: title,
      hintText: hintText,
      readOnly: readOnly,
      titleStyle: textTheme.headline4!.copyWith(
          fontWeight: FontWeight.w500,
          color: theme.buttonTheme.colorScheme!.background),
      inputStyle: textTheme.bodyText1!
          .copyWith(color: colorScheme.secondary.withOpacity(0.60)),
      hintStyle: textTheme.bodyText1!
          .copyWith(color: colorScheme.secondary.withOpacity(0.5)),
      underlineColor: colorScheme.secondary.withOpacity(0.73),
    );
  }
}
