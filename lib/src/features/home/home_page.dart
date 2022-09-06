import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up2u_base/src/features/events_details/events_detail_page.dart';
import 'package:up2u_base/src/features/profile/profile_page.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_outline_search_widget.dart';
import '../../shared/components/events_widget.dart';
import '../../shared/components/text_underlined_button_widget.dart';
import '../../shared/constants/constant_app_images.dart';
import 'components/commom_popup_title_widget.dart';
import 'components/commom_search_button_widget.dart';
import 'components/custom_dropdown_button_widget.dart';

class HomePage extends StatefulWidget {
  final bool isAnAdministrator;
  const HomePage({Key? key, required this.isAnAdministrator}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _bottomNavbarIndex = 0;
  List<bool> cardFavorite = [false, false, false];
  late TabController tabController;

  String? selectedEstabelishment;
  List<String> estebelishmentItems = [
    'pub',
    'priv',
    'asfafasf fefeafaf',
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
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  void _addAnEstabelishment() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavbarIndex == 0
          ? _buildHomePage()
          : ProfilePage(isAnAdministrator: widget.isAnAdministrator),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHomePage() {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: double.maxFinite),
            if (widget.isAnAdministrator)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 28, top: 35, left: 16),
                  child: Text(
                    'Meus Estabelecimentos',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return EventsWidget(
                    promotion: index != 1,
                    favorite: cardFavorite[index],
                    administrator: widget.isAnAdministrator,
                    onFavorite: () => setState(() {
                      cardFavorite[index] = !cardFavorite[index];
                    }),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventsDetailPage(
                                isAnAdministrator: widget.isAnAdministrator))),
                  );
                },
              ),
            ),
            if (widget.isAnAdministrator) const SizedBox(height: 16),
            if (widget.isAnAdministrator)
              TextUnderlinedButton(
                onTap: _addAnEstabelishment,
                title: 'Adicione mais um estabelecimento',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).primaryColor),
              ),
            if (widget.isAnAdministrator) const SizedBox(height: 16)
          ]),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      bottomLeftRadius: 18,
      bottomRightRadius: 18,
      height: widget.isAnAdministrator ? 136 : 186,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                  //TODO: substituir por imagem do usuário
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('images/profile_picture.jpeg'),
                    backgroundColor: Colors.grey,
                    radius: 24,
                  ),
                  title: Text(
                    'Bem-vindo, Fulado de Tal',
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Row(
                    children: [
                      SvgPicture.asset(ConstantAppImages.locale),
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
                if (!widget.isAnAdministrator) _buildSearchWidgets()
              ]),
        ),
      ),
    );
  }

  Widget _buildSearchWidgets() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: CustomOutlineSearch()),
          _filterPopUpMenu(
            icon: SvgPicture.asset(ConstantAppImages.filterAlt),
          )
        ],
      ),
    );
  }

  Widget _filterPopUpMenu({required Widget icon}) {
    final textTheme = Theme.of(context).textTheme;
    const popMenuDropDownHeight = 40.0;

    final commomTextStyle = textTheme.bodyText2!
        .copyWith(color: const Color(0xFF49494B), fontWeight: FontWeight.w400);

    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      position: PopupMenuPosition.under,
      color: Colors.white,
      icon: icon,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem<Text>(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          enabled: false,
          onTap: null,
          child: Text('Filtros',
              style: textTheme.headline4!.copyWith(color: Colors.black)),
        ),
        CommomPopupTitle(title: 'Estabelecimentos', textTheme: textTheme),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return CustomDropdownButton(
                onChanged: (String? value) {
                  setState(() {
                    selectedEstabelishment = value as String;
                  });
                },
                selectedValue: selectedEstabelishment,
                menuItems: estebelishmentItems,
                style: commomTextStyle);
          }),
        ),
        CommomPopupTitle(title: 'Estilo', textTheme: textTheme),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return CustomDropdownButton(
                onChanged: (String? value) {
                  setState(() {
                    selectedMusicStyle = value as String;
                  });
                },
                selectedValue: selectedMusicStyle,
                menuItems: musicStyleItems,
                style: commomTextStyle);
          }),
        ),
        CommomPopupTitle(title: 'Música', textTheme: textTheme),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return CustomDropdownButton(
                onChanged: (String? value) {
                  setState(() {
                    selectedMusic = value as String;
                  });
                },
                selectedValue: selectedMusic,
                menuItems: musicItems,
                style: commomTextStyle);
          }),
        ),
        CommomPopupTitle(title: 'Entrada', textTheme: textTheme),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return CustomDropdownButton(
                onChanged: (String? value) {
                  setState(() {
                    selectedEntrance = value as String;
                  });
                },
                selectedValue: selectedEntrance,
                menuItems: entranceItems,
                style: commomTextStyle);
          }),
        ),
        CommomPopupTitle(title: 'Favoritos', textTheme: textTheme),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return CustomDropdownButton(
                onChanged: (String? value) {
                  setState(() {
                    selectedFevorite = value as String;
                  });
                },
                selectedValue: selectedFevorite,
                menuItems: favoriteItems,
                style: commomTextStyle);
          }),
        ),
        PopupMenuItem(
          height: popMenuDropDownHeight,
          enabled: false,
          child: Row(
            children: [
              CommomSearchButton(onPressed: () {}, title: 'Limpar'),
              const SizedBox(width: 10),
              CommomSearchButton(onPressed: () {}, title: 'Aplicar'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    final theme = Theme.of(context);

    return ConvexAppBar(
      controller: tabController,
      onTap: (value) => setState(() {
        _bottomNavbarIndex = value;
      }),
      style: TabStyle.custom,
      backgroundColor: theme.colorScheme.surface,
      activeColor: theme.buttonTheme.colorScheme!.background,
      curveSize: 0,
      initialActiveIndex: _bottomNavbarIndex,
      items: [
        TabItem(
            icon: SvgPicture.asset(ConstantAppImages.home,
                fit: BoxFit.scaleDown,
                color: _bottomNavbarIndex != 0 ? theme.primaryColor : null),
            title: 'Home'),
        TabItem(
            icon: SvgPicture.asset(ConstantAppImages.user,
                fit: BoxFit.scaleDown,
                color: _bottomNavbarIndex != 1 ? theme.primaryColor : null),
            title: 'Opções'),
      ],
    );
  }
}
