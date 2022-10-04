import 'package:flutter/material.dart';
import 'package:up2u_base/src/shared/components/text_underlined_button_widget.dart';
import '../../../../shared/constants/app_images.dart';
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
    AppImages.menu1,
    AppImages.menu2,
    AppImages.menu3,
    AppImages.menu4,
    AppImages.menu5,
    AppImages.menu6,
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
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 22),
            child: Wrap(
              runSpacing: 4,
              spacing: 4,
              children: [
                for (int index = 0; index < menuTitles.length; index++)
                  CustomCardMenu(
                    image: menuImagens[index],
                    title: menuTitles[index],
                    onNavigator: widget.isAnAdministrator
                        ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditMenuPage(menu: _menus[index])))
                        : null,
                  )
              ],
            ),
          ),
        ),
        /* Expanded(
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
                  onNavigator: widget.isAnAdministrator
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditMenuPage(menu: _menus[index])))
                      : null,
                );
              }),
        ), */
        if (widget.isAnAdministrator)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextUnderlinedButton(
                  onTap: _onEditMenu, title: 'Editar Cardápio'),
            ),
          ),
      ],
    );
  }
}
