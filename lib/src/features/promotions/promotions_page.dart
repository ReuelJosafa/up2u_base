import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/components/commom_app_bar_widget.dart';
import '../../shared/components/commom_text_form_field_widget.dart';
import '../../shared/components/custom_add_elevated_button_widget.dart';
import '../../shared/components/custom_container_action_widget.dart';
import '../../shared/components/custom_expansion_tile_wiget.dart';
import '../../shared/utils/components_utils.dart';
import '../../shared/utils/date_time_utils.dart';
import 'controller/promotions_controller.dart';

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
  final promotionController = PromotionsController();

  void _onSubmit() {
    bool isValidated = formKey.currentState?.validate() ?? false;
    if (!isValidated) {
      return;
    }

    promotionController.addPromotion();
    _resetControllers();
  }

  void _resetControllers() {
    startTimeController.text =
        DateTimeUtils.toPtBrFormat(context, promotionController.startTime);
    endTimeController.text =
        DateTimeUtils.toPtBrFormat(context, promotionController.endTime);
    String formattedDate =
        DateFormat('dd/MM/yyyy').format(promotionController.date);
    dateController.text = formattedDate;
  }

  Future<void> _onChooseData() async {
    await DateTimeUtils.chooseData(
      context,
      initialDate: promotionController.date,
      onDateChanged: (newDate) {
        controller.animateTo(100,
            duration: const Duration(microseconds: 500), curve: Curves.easeIn);

        promotionController.date = newDate;
        String formattedDate =
            DateFormat('dd/MM/yyyy').format(promotionController.date);

        dateController.text = formattedDate;
      },
    );
  }

  Future<void> _onChooseStartTime() async {
    await DateTimeUtils.chooseTime(
      context,
      timeOfDay: promotionController.startTime,
      onTimeChanged: (newTime) {
        promotionController.startTime = newTime;
        startTimeController.text =
            DateTimeUtils.toPtBrFormat(context, promotionController.startTime);
      },
    );
  }

  Future<void> _onChooseEndTime() async {
    await DateTimeUtils.chooseTime(
      context,
      timeOfDay: promotionController.endTime,
      onTimeChanged: (newTime) {
        promotionController.endTime = newTime;
        endTimeController.text =
            DateTimeUtils.toPtBrFormat(context, promotionController.endTime);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _resetControllers();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    dateController.dispose();
    controller.dispose();
    promotionController.dispose();
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
              child: AnimatedBuilder(
                  animation: promotionController,
                  builder: (context, _) {
                    return CustomExpansionTile(
                      key: promotionController.expansionTileKey,
                      title: 'Adicionar Promoção',
                      isExpanded: promotionController.isExpanded,
                      onExpansionChanged: (_) {
                        promotionController.toggleExpanded();
                      },
                      children: [
                        CommmomTextFormField(
                            validator: promotionController.onValidator,
                            onChanged: promotionController.name,
                            title: 'Nome',
                            hintText: 'Lorem ipsum exemplo'),
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
                        CustomAddElevatedButton(onPressed: _onSubmit),
                      ],
                    );
                  }),
            ),
            AnimatedBuilder(
                animation: promotionController,
                builder: (context, _) {
                  return ListView.builder(
                      controller: controller,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(
                          parent: NeverScrollableScrollPhysics()),
                      itemCount: promotionController.promotions.length,
                      itemBuilder: (context, index) {
                        final promotion = promotionController.promotions[index];
                        return CustomContainerAction(
                            title: promotion.title,
                            subtitle: promotion.dateTimeAsString,
                            thirdtitle: promotion.activatedAsString,
                            trailing: ComponentsUtils.buildSwitch(
                              context,
                              value: promotion.activated,
                              onChanged: (_) {
                                promotionController
                                    .toggleActivatedOf(promotion.id);
                              },
                            ));
                      });
                }),
          ],
        ),
      ),
    );
  }
}
