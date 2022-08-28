import 'package:flutter/material.dart';
import 'package:up2u_base/src/shared/components/text_underlined_button_widget.dart';
import '../../../../shared/constants/constant_app_images.dart';
import '../edit_menu/edit_menu_page.dart';

class MenuSubpage extends StatefulWidget {
  final bool isAnAdministrator;
  const MenuSubpage({Key? key, required this.isAnAdministrator})
      : super(key: key);

  @override
  State<MenuSubpage> createState() => _MenuSubpageState();
}

class _MenuSubpageState extends State<MenuSubpage> {
  List<String> menuImagens = [
    ConstantAppImages.menu1,
    ConstantAppImages.menu2,
    ConstantAppImages.menu3,
    ConstantAppImages.menu4,
    ConstantAppImages.menu5,
    ConstantAppImages.menu6,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.only(
                  left: 64, right: 64, top: 32, bottom: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext ctx, index) {
                return _buildCustomCard(
                    image: menuImagens[index], index: index);
              }),
        ),
        if (widget.isAnAdministrator)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 46),
            child: TextUnderlinedButton(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditMenuPage())),
                title: 'Editar Cardápio'),
          ),
      ],
    );
  }

  Widget _buildCustomCard({required String image, required int index}) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: 110,
        width: 116,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 46),
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
