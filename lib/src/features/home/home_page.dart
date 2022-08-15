import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:up2u_base/src/features/profile/profile_page.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_outline_input_text_widget.dart';
import '../../shared/components/events_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final PageController controller = PageController();

  String? selectedEstabelishment;
  List<String> estebelishmentItems = [
    'pub',
    'priv',
    'asfafasf fefeafaf jbkbhkbkbl hvkhvkvvvkvkvk iioihbjlbkjb',
  ];

  String? selectedMusicStyle;
  List<String> musicStyleItems = [
    'Sertanejo',
    'Pagode',
    'Rock',
    'Samba',
  ];

  String? selectedMusic;
  List<String> musicItems = [
    'music 1',
    'music 2',
    'music 3',
    'music 4',
  ];

  String? selectedEntrance;
  List<String> entranceItems = [
    'entrada 1',
    'entrada 2',
    'entrada 3',
    'entrada 4',
  ];

  String? selectedFevorite;
  List<String> favoriteItems = [
    'não',
    'sim',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        controller: controller,
        children: [
          _homePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _homePage() {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(),
              EventsWidget(),
              EventsWidget(),
              EventsWidget(),
            ]),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return CustomAppBar(
      bottomLeftRadius: 18,
      bottomRightRadius: 18,
      height: 226,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                  //TODO: substituir por imagem do usuário
                  leading: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 24,
                  ),
                  title: Text(
                    'Bem-vindo, Fulado de Tal',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Row(
                    children: [
                      // TODO: Substituir por ícone do Figma
                      const Icon(Icons.place),
                      Text(
                        'Teste',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //TODO: Adicionar ações de input
                      const Expanded(
                        child: CustomOutlineInputText(),
                      ),
                      _filterPopUpMenu(icon: Icons.filter_list_alt)
                      /*  IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list_alt)) */
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget _filterPopUpMenu({required IconData icon}) {
    final textTheme = Theme.of(context).textTheme;
    const popMenuDropDownHeight = 40.0;
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      position: PopupMenuPosition.under,
      color: Colors.white,
      icon: Icon(icon),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem<Text>(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          enabled: false,
          onTap: null,
          child: Text('Filtros',
              style: textTheme.headline4!.copyWith(color: Colors.black)),
        ),
        _popupMenuItemTitle(title: 'Estabelecimentos', textTheme: textTheme),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return _bottomDropDown(
                onChanged: (String? value) {
                  setState(() {
                    selectedEstabelishment = value as String;
                  });
                },
                selectedValue: selectedEstabelishment,
                menuItems: estebelishmentItems,
                setstate: setState,
                style: textTheme.bodyText2!.copyWith(
                    color: const Color(0xFF49494B),
                    fontWeight: FontWeight.w400));
          }),
        ),
        _popupMenuItemTitle(title: 'Estilo', textTheme: textTheme),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return _bottomDropDown(
                onChanged: (String? value) {
                  setState(() {
                    selectedMusicStyle = value as String;
                  });
                },
                selectedValue: selectedMusicStyle,
                menuItems: musicStyleItems,
                setstate: setState,
                style: textTheme.bodyText2!.copyWith(
                    color: const Color(0xFF49494B),
                    fontWeight: FontWeight.w400));
          }),
        ),
        _popupMenuItemTitle(title: 'Música', textTheme: textTheme),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return _bottomDropDown(
                onChanged: (String? value) {
                  setState(() {
                    selectedMusic = value as String;
                  });
                },
                selectedValue: selectedMusic,
                menuItems: musicItems,
                setstate: setState,
                style: textTheme.bodyText2!.copyWith(
                    color: const Color(0xFF49494B),
                    fontWeight: FontWeight.w400));
          }),
        ),
        _popupMenuItemTitle(title: 'Entrada', textTheme: textTheme),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return _bottomDropDown(
                onChanged: (String? value) {
                  setState(() {
                    selectedEntrance = value as String;
                  });
                },
                selectedValue: selectedEntrance,
                menuItems: entranceItems,
                setstate: setState,
                style: textTheme.bodyText2!.copyWith(
                    color: const Color(0xFF49494B),
                    fontWeight: FontWeight.w400));
          }),
        ),
        _popupMenuItemTitle(title: 'Favoritos', textTheme: textTheme),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return _bottomDropDown(
                onChanged: (String? value) {
                  setState(() {
                    selectedFevorite = value as String;
                  });
                },
                selectedValue: selectedFevorite,
                menuItems: favoriteItems,
                setstate: setState,
                style: textTheme.bodyText2!.copyWith(
                    color: const Color(0xFF49494B),
                    fontWeight: FontWeight.w400));
          }),
        ),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return _bottomDropDown(
                onChanged: (String? value) {
                  setState(() {
                    selectedFevorite = value as String;
                  });
                },
                selectedValue: selectedFevorite,
                menuItems: favoriteItems,
                setstate: setState,
                style: textTheme.bodyText2!.copyWith(
                    color: const Color(0xFF49494B),
                    fontWeight: FontWeight.w400));
          }),
        ),
      ],
    );
  }

  PopupMenuItem _popupMenuItemTitle(
      {required String title, required TextTheme textTheme}) {
    return PopupMenuItem<Widget>(
      height: 18,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      enabled: false,
      onTap: null,
      child: Text(
        title,
        style: textTheme.bodyText1!.copyWith(
            color: const Color(0xFF49494B), fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _bottomDropDown(
      {required TextStyle style,
      required void Function(void Function()) setstate,
      required List<String> menuItems,
      String? selectedValue,
      void Function(String?)? onChanged}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        iconEnabledColor: const Color(0xFF0D0D0D),
        dropdownDecoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        selectedItemHighlightColor: Colors.amber,
        style: style,
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black26,
          ),
        ),
        hint: Text('Selecionar', style: style),
        value: selectedValue,
        onChanged: onChanged,
        buttonPadding: const EdgeInsets.symmetric(horizontal: 8),
        dropdownPadding: EdgeInsets.zero,
        isExpanded: true,
        buttonHeight: 28,
        // buttonWidth: 150,
        items: menuItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: style,
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _bottomNavBar() {
    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: colorScheme.surface,
      selectedItemColor: Colors.white,
      unselectedItemColor: Theme.of(context).primaryColor,
      currentIndex: selectedIndex,
      onTap: (value) => setState(() {
        controller.animateToPage(value,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        selectedIndex = value;
      }),
      items: const [
        //TODO: Substituir por ícones do Figma
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
      ],
    );
  }
}
