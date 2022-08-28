import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/components/commom_app_bar_widget.dart';
import '../../shared/components/custom_container_action_widget.dart';
import '../../shared/components/custom_expansion_tile_wiget.dart';
import '../../shared/components/commom_text_form_field_widget.dart';
import '../../shared/utils/cupertino_utils.dart';
import '../../shared/utils/date_time_utils.dart';
import '../../shared/utils/components_utils.dart';

class PromotionsPage extends StatefulWidget {
  const PromotionsPage({Key? key}) : super(key: key);

  @override
  State<PromotionsPage> createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final dateController = TextEditingController();
  final controller = ScrollController();
  final formKey = GlobalKey<FormState>();
  bool isExpanded = false;
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  DateTime _date = DateTime.now();

  void _addPromotion() {}

  Future<void> _onChooseData() async {
    await DateTimeUtils.chooseData(
      context,
      initialDate: _date,
      onDateChanged: (newDate) {
        controller.animateTo(100,
            duration: const Duration(microseconds: 500), curve: Curves.easeIn);

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
    return Scaffold(
      appBar: const CommomAppBar(
        title: 'Promoções',
        subtitle: 'Adicione uma nova promoção em seu estabelecimento',
      ),
      body: SingleChildScrollView(
        controller: controller,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: CustomExpansionTile(
                title: 'Adicionar Promoção',
                isExpanded: isExpanded,
                onExpansionChanged: (value) {
                  setState(() {
                    isExpanded = value;
                  });
                },
                children: [
                  const CommmomTextFormField(
                      title: 'Nome', hintText: 'Lorem ipsum exemplo'),
                  CommmomTextFormField(
                      controller: startTimeController,
                      readOnly: true,
                      onTap: _onChooseStartTime,
                      title: 'Início',
                      hintText: '00h00'),
                  CommmomTextFormField(
                      controller: endTimeController,
                      readOnly: true,
                      onTap: _onChooseEndTime,
                      title: 'Término',
                      hintText: '00h00'),
                  CommmomTextFormField(
                      controller: dateController,
                      readOnly: true,
                      onTap: _onChooseData,
                      title: 'Data',
                      hintText: 'Lorem ipsum exemplo'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: _addPromotion,
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
                controller: controller,
                shrinkWrap: true,
                physics:
                    const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomContainerAction(
                      title: 'Promoção $index',
                      subtitle: '27/02 das 19h á 02h',
                      thirdtitle: 'Ativado',
                      trailing: ComponentsUtils.buildSwitch(
                        context,
                        value: false,
                        onChanged: (value) {},
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
