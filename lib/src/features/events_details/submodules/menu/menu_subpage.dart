import 'package:flutter/material.dart';
import 'package:up2u_base/src/shared/components/text_underlined_button_widget.dart';

import '../edit_menu/edit_menu_page.dart';

class MenuSubpage extends StatefulWidget {
  const MenuSubpage({Key? key}) : super(key: key);

  @override
  State<MenuSubpage> createState() => _MenuSubpageState();
}

class _MenuSubpageState extends State<MenuSubpage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 32, right: 2, left: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              for (int x = 0; x < 6; x++) _buildCustomCard(),
            ],
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: TextUnderlinedButton(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditMenuPage())),
                  title: 'Editar Cardápio'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
    /* return GridView.builder(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 6,
          mainAxisSpacing: 8,
          crossAxisCount: 3,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext ctx, index) {
          return _buildCustomCard();
        }); */
  }

  Widget _buildCustomCard() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // margin: EdgeInsets.all(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        height: 110,
        width: 116,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.food_bank_outlined,
              size: 47,
            ),
            Text(
              'Lorems',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
