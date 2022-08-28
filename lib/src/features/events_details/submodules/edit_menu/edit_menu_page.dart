import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up2u_base/src/shared/components/commom_app_bar_widget.dart';

import '../../../../shared/components/custom_expansion_tile_wiget.dart';
import '../../../../shared/components/commom_text_form_field_widget.dart';
import '../../../../shared/constants/constant_app_images.dart';

class EditMenuPage extends StatefulWidget {
  const EditMenuPage({Key? key}) : super(key: key);

  @override
  State<EditMenuPage> createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenuPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommomAppBar(
          title: 'Cardápio',
          subtitle: 'Adicione ou modifique o cardapio do seu estabeleciemento'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'Bebidas',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return _buildListTile(index);
                },
              ),
            ),
            CustomExpansionTile(
              title: 'Adicionar',
              isExpanded: isExpanded,
              inverseTrailing: true,
              onExpansionChanged: (value) {
                setState(() {
                  isExpanded = value;
                });
              },
              children: [
                const CommmomTextFormField(
                    title: 'Nome', hintText: 'Lorem ipsum exemplo'),
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Lorem ipsum $index',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500)),
          SvgPicture.asset(ConstantAppImages.deleteAlt, fit: BoxFit.scaleDown),
        ],
      ),
    );
  }
}
