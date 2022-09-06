import 'package:flutter/material.dart';
import 'package:up2u_base/src/shared/components/text_underlined_button_widget.dart';
import '../../../../shared/constants/constant_app_images.dart';
import '../edit_menu/edit_menu_page.dart';
import 'components/custom_card_menu_widget.dart';
import 'model/menu.dart';

class MenuSubpage extends StatefulWidget {
  final bool isAnAdministrator;
  const MenuSubpage({Key? key, required this.isAnAdministrator})
      : super(key: key);

  @override
  State<MenuSubpage> createState() => _MenuSubpageState();
}

class _MenuSubpageState extends State<MenuSubpage> {
  final menuImagens = [
    ConstantAppImages.menu1,
    ConstantAppImages.menu2,
    ConstantAppImages.menu3,
    ConstantAppImages.menu4,
    ConstantAppImages.menu5,
    ConstantAppImages.menu6,
  ];

  final menuTitles = [
    'Bebidas',
    'Entradas',
    'Lorem inpsu',
    'Lorem inpsu',
    'Lorem inpsu',
    'Lorem inpsu',
  ];

  late List<Menu> _menus;
  @override
  void initState() {
    super.initState();

    _menus = [
      for (var menuTitle in menuTitles)
        Menu(
            title: menuTitle,
            list: List.generate(20, (index) => 'Lorem $menuTitle $index'))
    ];
  }

  void _onEditMenu() {
    // TODO: implementar ação ao pressionar o botão para alterar o cardápio.
  }

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
                return CustomCardMenu(
                  image: menuImagens[index],
                  title: menuTitles[index],
                  onNavigator: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditMenuPage(menu: _menus[index]))),
                );
              }),
        ),
        if (widget.isAnAdministrator)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 46),
            child: TextUnderlinedButton(
                onTap: _onEditMenu, title: 'Editar Cardápio'),
          ),
      ],
    );
  }
}
