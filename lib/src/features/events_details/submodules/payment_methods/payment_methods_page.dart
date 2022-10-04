import 'package:flutter/material.dart';

import '../../../../shared/components/custom_checkbox_tile_widget.dart';
import '../../../../shared/components/text_underlined_button_widget.dart';
import '../../../../shared/constants/app_images.dart';
import 'components/expanded_section_widget.dart';

class PaymentMethodsPage extends StatefulWidget {
  final bool isAnAdministrator;
  const PaymentMethodsPage({Key? key, required this.isAnAdministrator})
      : super(key: key);

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  bool _isCreditCardExpanded = false;
  bool _isDebitCardExpanded = false;
  bool _isMealTicketExpanded = false;
  bool _isPixIncluded = false;
  bool _isPicpayIncluded = false;
  List<bool> _creditCardOptions = [false, false, false, false];
  List<bool> _debitCardOptions = [false, false, false, false];
  List<bool> _mealTicketOptions = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(AppImages.background, height: 352)),
          SingleChildScrollView(
              padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Formas de pagamento',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontWeight: FontWeight.w500)),
                  const Divider(thickness: 1, color: Colors.white),
                  const SizedBox(height: 22),
                  _buildExpansionTile(
                      title: 'Cartão de Credito',
                      icon: Image.asset(AppImages.customCreditCard,
                          fit: BoxFit.contain),
                      subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                              height: 30,
                              AppImages.creditCardBanner,
                              fit: BoxFit.scaleDown)),
                      editable: widget.isAnAdministrator,
                      expanded: _isCreditCardExpanded,
                      onExpanded: () => setState(() {
                            _isCreditCardExpanded = !_isCreditCardExpanded;
                          }),
                      children: widget.isAnAdministrator
                          ? _buildEditComponents(_creditCardOptions)
                          : null),
                  const SizedBox(height: 22),
                  _buildExpansionTile(
                      title: 'Cartão de Débito',
                      icon: Image.asset(AppImages.debitCard,
                          fit: BoxFit.scaleDown),
                      subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                              height: 30,
                              AppImages.creditCardBanner,
                              fit: BoxFit.scaleDown)),
                      editable: widget.isAnAdministrator,
                      expanded: _isDebitCardExpanded,
                      onExpanded: () => setState(() {
                            _isDebitCardExpanded = !_isDebitCardExpanded;
                          }),
                      children: _buildEditComponents(_debitCardOptions)),
                  const SizedBox(height: 22),
                  _buildExpansionTile(
                      title: 'Vale Refeição',
                      icon: Image.asset(AppImages.mealTicket,
                          fit: BoxFit.scaleDown),
                      subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                              height: 30,
                              AppImages.creditCardBanner,
                              fit: BoxFit.scaleDown)),
                      editable: widget.isAnAdministrator,
                      expanded: _isMealTicketExpanded,
                      onExpanded: () => setState(() {
                            _isMealTicketExpanded = !_isMealTicketExpanded;
                          }),
                      children: _buildEditComponents(_mealTicketOptions)),
                  const SizedBox(height: 22),
                  _buildCustomTile(
                      title: 'Pix',
                      icon: Image.asset(AppImages.pix, fit: BoxFit.scaleDown),
                      trailing: widget.isAnAdministrator
                          ? _buildCommomTrailingButton(
                              onTap: () => setState(() {
                                _isPixIncluded = !_isPixIncluded;
                              }),
                              isInclusion: _isPixIncluded,
                            )
                          : null),
                  const SizedBox(height: 22),
                  _buildCustomTile(
                      title: 'Picpay',
                      icon:
                          Image.asset(AppImages.picpay, fit: BoxFit.scaleDown),
                      trailing: widget.isAnAdministrator
                          ? _buildCommomTrailingButton(
                              onTap: () => setState(() {
                                _isPicpayIncluded = !_isPicpayIncluded;
                              }),
                              isInclusion: _isPicpayIncluded,
                            )
                          : null),
                  const SizedBox(height: 22),
                ],
              )),
        ],
      ),
    );
  }

  Container _buildCustomTile({
    required Widget icon,
    bool expanded = false,
    Widget? subtitle,
    required String title,
    Widget? trailing,
  }) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: expanded
              ? null
              : [const BoxShadow(blurRadius: 4, offset: Offset(0, 4))],
          borderRadius: BorderRadius.circular(38),
          border: Border.all(color: Theme.of(context).primaryColor),
          color: Theme.of(context).scaffoldBackgroundColor),
      child: ListTile(
          // ignore: sized_box_for_whitespace
          leading: Container(
            alignment: Alignment.center,
            width: 32,
            height: double.infinity,
            child: icon,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
            borderRadius: BorderRadius.circular(38),
          ),
          title: Text(title, style: Theme.of(context).textTheme.headline5),
          subtitle: subtitle,
          trailing: trailing),
    );
  }

  Widget _buildExpansionTile(
      {required String title,
      required Widget icon,
      Widget? subtitle,
      bool editable = false,
      void Function()? onExpanded,
      bool expanded = false,
      List<Widget>? children}) {
    if (!editable) {
      return _buildCustomTile(
        title: title,
        icon: icon,
        expanded: expanded,
        subtitle: subtitle,
        trailing: editable
            ? TextUnderlinedButton(
                title: 'Editar',
                onTap: onExpanded,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline),
              )
            : null,
      );
    }

    return SizedBox(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 36, right: 4, left: 4),
            child: ExpandedSection(
                expand: expanded,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 68, 16, 16),
                  child: Column(
                    children: children!,
                  ),
                )),
          ),
          _buildCustomTile(
            title: title,
            icon: icon,
            expanded: expanded,
            subtitle: subtitle,
            trailing: editable
                ? TextUnderlinedButton(
                    title: 'Editar',
                    onTap: onExpanded,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline),
                  )
                : null,
          )
        ],
      ),
    );
  }

  List<Widget> _buildEditComponents(List<bool> options) {
    // final copyOfOptions = [...options];
    final lenghtHalfOfOptions =
        options.length ~/ 2 + (options.length % 2 != 0 ? 1 : 0);
    return [
      StatefulBuilder(builder: (context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int index = 0; index < lenghtHalfOfOptions; index++)
                  CustomCheckboxTile(
                    title: 'Lorem Ipsum',
                    value: options[index],
                    onChanged: (value) {
                      setState(() {
                        options[index] = !options[index];
                      });
                    },
                  )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int index = lenghtHalfOfOptions;
                    index < options.length;
                    index++)
                  CustomCheckboxTile(
                    title: 'Lorem Ipsum',
                    value: options[index],
                    onChanged: (value) {
                      setState(() {
                        options[index] = !options[index];
                      });
                    },
                  )
              ],
            ),
          ],
        );
      }),
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
          child: const Text('Salvar alterações'),
        ),
      ),
    ];
  }

  Widget _buildCommomTrailingButton(
      {required void Function()? onTap, required bool isInclusion}) {
    return TextUnderlinedButton(
      title: isInclusion ? 'Incluir' : 'Remover',
      onTap: onTap,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: Theme.of(context).primaryColor,
          decoration: TextDecoration.underline),
    );
  }
}
