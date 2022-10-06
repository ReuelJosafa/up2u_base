import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/components/alert_dialog_action_button_widget.dart';
import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_close_button_widget.dart';
import '../../shared/components/commom_text_form_field_widget.dart';
import '../../shared/components/text_underlined_button_widget.dart';
import '../../shared/constants/app_images.dart';
import '../../shared/utils/components_utils.dart';
import 'submodules/about/about_subpage.dart';
import 'submodules/initial/initial_subpage.dart';
import 'submodules/list/attandence_list_subpage.dart';
import 'submodules/menu/menu_subpage.dart';
import 'submodules/payment_methods/payment_methods_page.dart';

class EventsDetailPage extends StatefulWidget {
  final bool isAnAdministrator;

  const EventsDetailPage({Key? key, required this.isAnAdministrator})
      : super(key: key);

  @override
  State<EventsDetailPage> createState() => _EventsDetailPageState();
}

class _EventsDetailPageState extends State<EventsDetailPage> {
  /* List<String> imagesUrl = [
    'https://media.gettyimages.com/photos/crowd-of-people-at-concert-waving-arms-in-the-air-picture-id130899584?s=612x612',
    'https://media.tacdn.com/media/attractions-splice-spp-674x446/07/2a/43/cc.jpg',
    'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFydHl8ZW58MHx8MHx8&w=1000&q=80'
  ]; */

  List<String> imagesPub = [
    'images/party1.jpg',
    'images/party2.jpg',
    'images/party3.jpg',
    'images/party1.jpg',
    'images/party2.jpg',
    'images/party3.jpg',
  ];

  int currentImageindex = 0;
  String partyName = 'Festa lorem ipsum f f ';
  String address = 'Rua exemplo - SP';
  String logoUrl = 'images/party_logo.png';
  String _wifiPassword = 'LOREMIPSUM123';

  void _open99taxis() {}

  void _openMap() async {
    String query = 'Praia de Ipanema - Ipanema, RJ';
    late Uri mapsUri;
    const latLgn = "0,0";

    if (Platform.isAndroid) {
      //TODO: Para mais detalhes de implementação no android
      //https://developer.android.com/guide/components/intents-common#ViewMap
      String? encodeQueryParameters(Map<String, String> params) {
        return params.entries
            .map((MapEntry<String, String> e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
            .join('&');
      }

      mapsUri = Uri(
        scheme: 'geo',
        path: latLgn,
        query: encodeQueryParameters(<String, String>{
          'q': query,
        }),
      );
    } else {
      //TODO: Conferir em https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/MapLinks/MapLinks.html#//apple_ref/doc/uid/TP40007899-CH5-SW1
      query = query.replaceAll(' ', '+');
      mapsUri = Uri.parse('http://maps.apple.com/?q=$query&sll=$latLgn');
    }

    if (!await launchUrl(mapsUri)) {
      throw 'Não foi possível concluir a operação';
    }
  }

  void _openUber() {}

  void _openWaze() {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.isAnAdministrator ? 4 : 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        resizeToAvoidBottomInset: false,
        body: TabBarView(children: [
          InicialSubpage(
            isAnAdministrator: widget.isAnAdministrator,
            partyName: partyName,
            address: address,
          ),
          MenuSubpage(isAnAdministrator: widget.isAnAdministrator),
          if (widget.isAnAdministrator) const AttandenceListSubpage(),
          AboutSubpage(isAnAdministrator: widget.isAnAdministrator)
        ]),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      /*  bottomRightRadius: 30,
      bottomLeftRadius: 30, */
      height: widget.isAnAdministrator ? 330 : 357,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                _buildSlidePhotos(),
                _buildSlidePhotosIndicator(),
                Positioned(
                  top: 46,
                  left: 16,
                  child: ComponentsUtils.buildArrowBack(context),
                ),
                if (widget.isAnAdministrator)
                  Positioned(
                    top: 46,
                    right: 16,
                    child: GestureDetector(
                      onTap: _showChagePhotosDialog,
                      child: SvgPicture.asset(
                        AppImages.editAlt,
                        height: 28,
                        width: 28,
                      ),
                    ),
                  ),
              ],
            ),
            ListTile(
              minVerticalPadding: 15,
              horizontalTitleGap: 8,
              leading: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 46,
                    width: 46,
                    child: ImageFiltered(
                      imageFilter: widget.isAnAdministrator
                          ? ImageFilter.blur(
                              sigmaX: 2, sigmaY: 2, tileMode: TileMode.decal)
                          : ImageFilter.blur(),
                      // TODO: alterar para Image.network e alterar url na variável.
                      child: Image.asset(logoUrl, fit: BoxFit.cover),
                    ),
                  ),
                  if (widget.isAnAdministrator)
                    SvgPicture.asset(AppImages.camera, fit: BoxFit.scaleDown)
                ],
              ),
              title:
                  Text(partyName, maxLines: 2, overflow: TextOverflow.ellipsis),
              subtitle: Text(address),
              trailing: widget.isAnAdministrator
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildCustomButton(
                            horizontalPadding: false,
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentMethodsPage(
                                          isAnAdministrator:
                                              widget.isAnAdministrator)),
                                ),
                            child: SvgPicture.asset(AppImages.creditCard)),
                        const SizedBox(width: 8),
                        _buildCustomButton(
                            horizontalPadding: false,
                            onPressed: _showWifiAlertDialog,
                            child: const Icon(Icons.wifi)),
                      ],
                    )
                  : null,
            ),
            if (!widget.isAnAdministrator)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TODO: implementar ação conforme orientação no Trello.

                    Expanded(
                      child: _buildCustomButton(
                          onPressed: _showRemoveAlertDialog,
                          child: const Text('Ir para o local')),
                    ),
                    _buildCustomButton(
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentMethodsPage(
                                      isAnAdministrator:
                                          widget.isAnAdministrator)),
                            ),
                        child: SvgPicture.asset(AppImages.creditCard)),
                    _buildCustomButton(
                        onPressed: _showWifiAlertDialog,
                        child: const Icon(Icons.wifi)),
                  ],
                ),
              ),
            TabBar(
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 5,
              labelColor: Theme.of(context).colorScheme.secondary,
              labelStyle: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              tabs: [
                const Tab(text: 'Início'),
                const Tab(text: 'Cardápio'),
                if (widget.isAnAdministrator) const Tab(text: 'Lista'),
                const Tab(text: 'Sobre'),
              ],
            )
          ]),
    );
  }

  Widget _buildSlidePhotos() {
    return SizedBox(
      height: 180,
      width: double.maxFinite,
      child: PageView.builder(
          itemCount: imagesPub.length,
          onPageChanged: ((value) {
            setState(() {
              currentImageindex = value;
            });
          }),
          itemBuilder: (context, pagePosition) {
            return Container(
                margin: const EdgeInsets.all(0),
                child: Image.asset(imagesPub[pagePosition], fit: BoxFit.cover));
          }),
    );
  }

  Widget _buildSlidePhotosIndicator() {
    return Positioned.fill(
      bottom: 16,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(imagesPub.length, (index) {
              return Container(
                margin: const EdgeInsets.all(3),
                width: currentImageindex == index ? 10 : 5,
                height: currentImageindex == index ? 10 : 5,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              );
            })),
      ),
    );
  }

  void _showChagePhotosDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: colorScheme.onBackground,
            titlePadding: const EdgeInsets.all(0),
            title: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 44, 24, 0),
                  child: Text('Edite suas fotos',
                      style: textTheme.headline5!.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w700)),
                ),
                const Positioned(top: 2, right: 2, child: CustomCloseButton()),
              ],
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.count(
                childAspectRatio: (1 / .75),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 16,
                children: [
                  for (var image in imagesPub) _buildPhotoCard(image),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(9))),
                      child: const Center(child: Icon(Icons.add)),
                    ),
                  )
                ],
              ),
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              AlertDialogActionButton(
                  onPressed: () {}, title: 'Salvar', filled: true),
            ],
          );
        }));
  }

  Widget _buildPhotoCard(String imageUrl) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imageUrl)),
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(9))),
        ),
        Positioned(
            bottom: 10,
            right: 8,
            child: InkWell(
                onTap: () {},
                child:
                    SvgPicture.asset(AppImages.delete, fit: BoxFit.scaleDown)))
      ],
    );
  }

  _showRemoveAlertDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: colorScheme.onBackground,
            title: Text(
              'Selecione um dos apps',
              style: textTheme.headline4!.copyWith(
                  color: colorScheme.surface, fontWeight: FontWeight.w600),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildOpenAppButton(
                    image: AppImages.taxis99,
                    title: '99taxis',
                    onTap: _open99taxis),
                _buildOpenAppButton(
                    image: AppImages.maps,
                    title: 'Google maps',
                    onTap: _openMap),
                _buildOpenAppButton(
                    image: AppImages.uber, title: 'Uber', onTap: _openUber),
                _buildOpenAppButton(
                    image: AppImages.waze, title: 'Waze', onTap: _openWaze),
              ],
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              AlertDialogActionButton(
                  onPressed: () => Navigator.pop(context, false),
                  title: 'Cancelar',
                  outlineBorder: true),
            ],
          );
        })).then((value) => value);
  }

  Widget _buildOpenAppButton(
      {required String image, required String title, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image))),
            ),
            // Image.asset(image, width: 48, height: 48),
            const SizedBox(width: 8),
            Text(title)
          ],
        ),
      ),
    );
  }

  void _showWifiAlertDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final buttonColorScheme = Theme.of(context).buttonTheme.colorScheme;
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: colorScheme.onBackground,
            titlePadding: const EdgeInsets.all(0),
            title: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 44, 24, 0),
                  child: Text(
                    'Lorem ipsum nome wifi',
                    style: textTheme.headline4!.copyWith(
                        color: colorScheme.surface,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Positioned(top: 2, right: 2, child: CustomCloseButton()),
              ],
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Lorem ipsum dolor sit amet, conse adipisci elit, sed eiusmod '
                  'tempor incidunt ut ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w300, color: Colors.black),
                ),
                const SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: _wifiPassword));
                    Navigator.pop(context);
                    ComponentsUtils.showSnackBar(context,
                        text: 'Senha do Wi-Fi copiada');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: buttonColorScheme!.background),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: buttonColorScheme.secondary),
                    child: Text(
                      _wifiPassword,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: buttonColorScheme.background),
                    ),
                  ),
                ),
              ],
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: widget.isAnAdministrator
                ? [
                    TextUnderlinedButton(
                      onTap: _showEditWifiAlertDialog,
                      title: 'Editar',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).primaryColor),
                    ),
                  ]
                : null,
          );
        }));
  }

  void _showEditWifiAlertDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: colorScheme.onBackground,
            contentPadding: const EdgeInsets.all(0),
            content: Stack(
              alignment: Alignment.center,
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommmomTextFormField(
                        title: 'Nome da rede',
                        hintText: 'Lorem ipsum',
                        titleStyle: textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF000000).withOpacity(0.59)),
                        inputStyle: textTheme.bodyText1!.copyWith(
                            color: const Color(0xFF000000).withOpacity(0.59)),
                        hintStyle: textTheme.bodyText1!.copyWith(
                            color: const Color(0xFF000000).withOpacity(0.49)),
                        underlineColor:
                            const Color(0xFF000000).withOpacity(0.29),
                      ),
                      CommmomTextFormField(
                        title: 'Descrição',
                        hintText: 'Lorem ipsum',
                        titleStyle: textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF000000).withOpacity(0.59)),
                        inputStyle: textTheme.bodyText1!.copyWith(
                            color: const Color(0xFF000000).withOpacity(0.59)),
                        hintStyle: textTheme.bodyText1!.copyWith(
                            color: const Color(0xFF000000).withOpacity(0.49)),
                        underlineColor:
                            const Color(0xFF000000).withOpacity(0.29),
                      ),
                      CommmomTextFormField(
                        title: 'Senha',
                        hintText: '0000-0000',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (_) {
                          //TODO: Submeter formulário aqui.
                        },
                        titleStyle: textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF000000).withOpacity(0.59)),
                        inputStyle: textTheme.bodyText1!.copyWith(
                            color: const Color(0xFF000000).withOpacity(0.59)),
                        hintStyle: textTheme.bodyText1!.copyWith(
                            color: const Color(0xFF000000).withOpacity(0.49)),
                        underlineColor:
                            const Color(0xFF000000).withOpacity(0.29),
                      ),
                    ],
                  ),
                ),
                const Positioned(top: 2, right: 2, child: CustomCloseButton()),
              ],
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              AlertDialogActionButton(
                  onPressed: () {}, title: 'Salvar', filled: true),
            ],
          );
        }));
  }

  Widget _buildCustomButton(
      {required void Function()? onPressed,
      required Widget child,
      bool horizontalPadding = true}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ? 4 : 0),
      child: Material(
        textStyle: Theme.of(context).textTheme.button!.copyWith(),
        borderRadius: const BorderRadius.all(Radius.circular(90)),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).colorScheme.secondary,
        child: InkWell(
          onTap: onPressed,
          splashColor: Colors.white.withOpacity(0.3),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 37,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
