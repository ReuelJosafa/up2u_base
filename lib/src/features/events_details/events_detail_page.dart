import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/components/alert_dialog_action_button_widget.dart';
import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_close_button_widget.dart';
import '../../shared/components/commom_text_form_field_widget.dart';
import '../../shared/components/text_underlined_button_widget.dart';
import '../../shared/constants/constant_app_images.dart';
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
  ];

  int currentImageindex = 0;
  String partyName = 'Festa lorem ipsum';
  String address = 'Rua exemplo - SP';

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
      bottomRightRadius: 30,
      bottomLeftRadius: 30,
      height: 357,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 180,
                  width: double.maxFinite,
                  child: PageView.builder(
                      itemCount: imagesPub.length,
                      pageSnapping: true,
                      onPageChanged: ((value) {
                        setState(() {
                          currentImageindex = value;
                        });
                      }),
                      itemBuilder: (context, pagePosition) {
                        return Container(
                            margin: const EdgeInsets.all(0),
                            child: Image.asset(imagesPub[pagePosition],
                                fit: BoxFit.cover));
                      }),
                ),
                Positioned.fill(
                  bottom: 16,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List<Widget>.generate(imagesPub.length, (index) {
                          return Container(
                            margin: const EdgeInsets.all(3),
                            width: currentImageindex == index ? 10 : 5,
                            height: currentImageindex == index ? 10 : 5,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          );
                        })),
                  ),
                ),
                Positioned(
                  top: 46,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
                if (widget.isAnAdministrator)
                  Positioned(
                    top: 46,
                    right: 16,
                    child: GestureDetector(
                      onTap: _showChagePhotosDialog,
                      child: SvgPicture.asset(ConstantAppImages.editAlt),
                    ),
                  ),
              ],
            ),
            ListTile(
              minVerticalPadding: 15,
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
                      child: Image.asset('images/party_logo.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  if (widget.isAnAdministrator)
                    SvgPicture.asset(ConstantAppImages.camera,
                        fit: BoxFit.scaleDown)
                ],
              ),
              title: Text(partyName),
              subtitle: Text(address),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildCustomElevatedButton(
                        onPressed: () {}, child: const Text('Ir para o local')),
                  ),
                  _buildCustomElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethodsPage(
                                  isAnAdministrator:
                                      widget.isAnAdministrator))),
                      child: SvgPicture.asset(ConstantAppImages.creditCard)),
                  _buildCustomElevatedButton(
                      onPressed: () {
                        _showWifiAlertDialog();
                      },
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

  void _showChagePhotosDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Widget buildPhotoCard() {
      return Stack(
        children: [
          Container(
            height: 120,
            width: 98,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(9))),
          ),
          Positioned(
              bottom: 10,
              right: 8,
              child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(ConstantAppImages.delete,
                      fit: BoxFit.scaleDown)))
        ],
      );
    }

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
            content: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                buildPhotoCard(),
                buildPhotoCard(),
                buildPhotoCard(),
                buildPhotoCard(),
                buildPhotoCard(),
                /* Container(
                  height: 120,
                  width: 98,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                  child: const Center(child: Icon(Icons.add)),
                ) */
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
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: buttonColorScheme!.background),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: buttonColorScheme.secondary),
                  child: Text(
                    'LOREMIPSUM123',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: buttonColorScheme.background),
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

  Widget _buildCustomElevatedButton(
      {required void Function()? onPressed, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            textStyle: Theme.of(context).textTheme.button,
            fixedSize: const Size.fromHeight(37),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          child: child),
    );
  }
}
