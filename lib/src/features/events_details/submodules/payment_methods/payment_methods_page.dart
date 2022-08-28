import 'package:flutter/material.dart';

import '../../../../shared/components/custom_checkbox_tile_widget.dart';
import '../../../../shared/components/text_underlined_button_widget.dart';
import '../../../../shared/constants/constant_app_images.dart';
import 'components/expanded_section_widget.dart';

class PaymentMethodsPage extends StatefulWidget {
  final bool isAnAdministrator;
  const PaymentMethodsPage({Key? key, required this.isAnAdministrator})
      : super(key: key);

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  bool _isExpanded = false;
  bool isExpandedDebito = false;

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
              child: Image.asset(ConstantAppImages.background, height: 352)),
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
                  _expansionTile(
                      title: 'Cartão de Credito',
                      icon: Image.asset(ConstantAppImages.customCreditCard,
                          fit: BoxFit.contain),
                      subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                              height: 20,
                              ConstantAppImages.creditCardBanner,
                              fit: BoxFit.scaleDown)),
                      editable: widget.isAnAdministrator,
                      expanded: _isExpanded,
                      onExpanded: () => setState(() {
                            _isExpanded = !_isExpanded;
                          }),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCheckboxTile(
                                  title: 'Lorem Ipsum',
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                CustomCheckboxTile(
                                  title: 'Lorem Ipsum',
                                  value: false,
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCheckboxTile(
                                  title: 'Lorem Ipsum',
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                CustomCheckboxTile(
                                  title: 'Lorem Ipsum',
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
                      ]),
                  const SizedBox(height: 22),
                  _expansionTile(
                      title: 'Cartão de Débito',
                      icon: Image.asset(ConstantAppImages.debitCard,
                          fit: BoxFit.scaleDown),
                      subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                              height: 20,
                              ConstantAppImages.creditCardBanner,
                              fit: BoxFit.scaleDown)),
                      editable: widget.isAnAdministrator,
                      expanded: isExpandedDebito,
                      onExpanded: () => setState(() {
                            isExpandedDebito = !isExpandedDebito;
                          }),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCheckboxTile(
                                  title: 'Lorem Ipsum',
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                CustomCheckboxTile(
                                  title: 'Lorem Ipsum',
                                  value: false,
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomCheckboxTile(
                                  title: 'Lorem Ipsum',
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                CustomCheckboxTile(
                                  title: 'Lorem Ipsum',
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
                      ]),
                  const SizedBox(height: 22),
                  _expansionTile(
                    title: 'Vale Refeição',
                    icon: Image.asset(ConstantAppImages.mealTicket,
                        fit: BoxFit.scaleDown),
                  ),
                  const SizedBox(height: 22),
                  _expansionTile(
                    title: 'Pix',
                    icon: Image.asset(ConstantAppImages.pix,
                        fit: BoxFit.scaleDown),
                  ),
                  const SizedBox(height: 22),
                  _expansionTile(
                    title: 'Picpay',
                    icon: Image.asset(ConstantAppImages.picpay,
                        fit: BoxFit.scaleDown),
                  ),
                  const SizedBox(height: 22),
                ],
              )),
        ],
      ),
    );
  }

  Widget _expansionTile(
      {required String title,
      required Widget icon,
      Widget? subtitle,
      bool editable = false,
      void Function()? onExpanded,
      bool expanded = false,
      List<Widget>? children}) {
    Container customTile = Container(
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
        trailing: editable
            ? TextUnderlinedButton(
                title: 'Editar',
                onTap: onExpanded,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline),
              )
            : null,
      ),
    );

    if (!editable) {
      return customTile;
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
          customTile
        ],
      ),
    );
  }
}
