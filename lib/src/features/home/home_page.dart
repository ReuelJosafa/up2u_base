import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:up2u_base/src/features/events_details/events_detail_page.dart';
import 'package:up2u_base/src/features/profile/profile_page.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_outline_search_widget.dart';
import '../../shared/components/events_widget.dart';
import '../../shared/components/text_underlined_button_widget.dart';
import '../../shared/constants/app_images.dart';
import '../../shared/controllers/local_of_events_list_controller.dart';
import 'components/commom_search_button_widget.dart';
import 'components/custom_dropdown_button_widget.dart';
import 'components/custom_trailing_checkbox_widget.dart';

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

  String? _selectedEstabelishment;
  List<String> estebelishmentItems = [
    'pub',
    'priv',
    'exe 1',
    'exe 2',
  ];

  String? _selectedMusicStyle;
  List<String> musicStyleItems = [
    'Sertanejo',
    'Pagode',
    'Rock',
    'Samba',
  ];

  bool _isLiveMusic = false;
  bool _isFreeEntrance = false;
  bool _isFavorite = false;

  void _addAnEstabelishment() {}

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

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
              child: Consumer<LocalOfEventListController>(
                builder: (_, controller, __) {
                  return ListView.builder(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    itemCount: controller.localOfEvents.length,
                    itemBuilder: (context, index) {
                      final localOfEvent = controller.localOfEvents[index];
                      return EventsWidget(
                        localOfEvent: localOfEvent,
                        administrator: widget.isAnAdministrator,
                        onFavorite: () {
                          controller.toggleFavorite(localOfEvent.id);
                        },
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventsDetailPage(
                                    isAnAdministrator:
                                        widget.isAnAdministrator))),
                      );
                    },
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
            if (widget.isAnAdministrator) const SizedBox(height: 48)
          ]),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      /* bottomLeftRadius: 18,
      bottomRightRadius: 18, */
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
                      SvgPicture.asset(AppImages.locale),
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
            icon: SvgPicture.asset(AppImages.filterAlt),
          )
        ],
      ),
    );
  }

  Widget _filterPopUpMenu({required Widget icon}) {
    return PopupMenuButton(
      enableFeedback: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      position: PopupMenuPosition.under,
      color: Colors.white,
      icon: icon,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            enabled: false,
            onTap: null,
            child: _buildSearchComponents()),
      ],
    );
  }

  Widget _buildSearchComponents() {
    String? selectedEstabelishment = _selectedEstabelishment;
    String? selectedMusicStyle = _selectedMusicStyle;
    bool isLiveMusic = _isLiveMusic;
    bool isFreeEntrance = _isFreeEntrance;
    bool isFavorite = _isFavorite;

    final textTheme = Theme.of(context).textTheme;

    final commomTextStyle = textTheme.bodyText2!
        .copyWith(color: const Color(0xFF49494B), fontWeight: FontWeight.w400);

    void cleanSearchFields() {
      selectedEstabelishment = null;
      selectedMusicStyle = null;
      isLiveMusic = false;
      isFreeEntrance = false;
      isFavorite = false;
    }

    void setGlobalSeaarchFields() {
      _selectedEstabelishment = selectedEstabelishment;
      _selectedMusicStyle = selectedMusicStyle;
      _isLiveMusic = isLiveMusic;
      _isFreeEntrance = isFreeEntrance;
      _isFavorite = isFavorite;
    }

    return StatefulBuilder(
      builder: (context, setMainState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filtros',
                style: textTheme.headline4!.copyWith(color: Colors.black)),
            _buildCommomTitle('Estabelecimentos', textTheme),
            StatefulBuilder(
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
            _buildCommomTitle('Estilo', textTheme),
            StatefulBuilder(
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
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return CustomTrailingCheckbox(
                title: 'Música ao vivo',
                style: textTheme.bodyText1!.copyWith(
                    color: const Color(0xFF49494B),
                    fontWeight: FontWeight.w600),
                value: isLiveMusic,
                onChanged: (_) => setState(() {
                  isLiveMusic = !isLiveMusic;
                }),
              );
            }),
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return CustomTrailingCheckbox(
                title: 'Entrada gratuita',
                style: textTheme.bodyText1!.copyWith(
                    color: const Color(0xFF49494B),
                    fontWeight: FontWeight.w600),
                value: isFreeEntrance,
                onChanged: (_) => setState(() {
                  isFreeEntrance = !isFreeEntrance;
                }),
              );
            }),
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return CustomTrailingCheckbox(
                title: 'Favoritos',
                style: textTheme.bodyText1!.copyWith(
                    color: const Color(0xFF49494B),
                    fontWeight: FontWeight.w600),
                value: isFavorite,
                onChanged: (_) => setState(() {
                  isFavorite = !isFavorite;
                }),
              );
            }),
            Row(
              children: [
                CommomSearchButton(
                    onPressed: () => setMainState(cleanSearchFields),
                    title: 'Limpar'),
                const SizedBox(width: 10),
                CommomSearchButton(
                    onPressed: () {
                      setMainState(setGlobalSeaarchFields);
                      Navigator.pop(context);
                    },
                    title: 'Aplicar'),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildCommomTitle(String title, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: textTheme.bodyText1!.copyWith(
            color: const Color(0xFF49494B), fontWeight: FontWeight.w600),
      ),
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
            icon: SvgPicture.asset(AppImages.home,
                fit: BoxFit.scaleDown,
                color: _bottomNavbarIndex != 0 ? theme.primaryColor : null),
            title: 'Home'),
        TabItem(
            icon: SvgPicture.asset(AppImages.user,
                fit: BoxFit.scaleDown,
                color: _bottomNavbarIndex != 1 ? theme.primaryColor : null),
            title: 'Opções'),
      ],
    );
  }
}
