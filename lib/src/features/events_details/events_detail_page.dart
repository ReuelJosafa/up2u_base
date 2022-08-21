import 'package:flutter/material.dart';

import '../../shared/components/alert_dialog_action_button_widget.dart';
import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_text_form_field_widget.dart';
import '../../shared/components/text_underlined_button_widget.dart';
import '../payment_methods/payment_methods_page.dart';
import 'submodules/about/about_subpage.dart';
import 'submodules/initial/initial_subpage.dart';
import 'submodules/list/attandence_list_subpage.dart';
import 'submodules/menu/menu_subpage.dart';

class EventsDetailPage extends StatefulWidget {
  const EventsDetailPage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _appBar(),
        body: const TabBarView(children: [
          InicialSubpage(),
          MenuSubpage(),
          AttandenceListSubpage(),
          AboutSubpage()
        ]),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
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
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 16),
            ListTile(
              minVerticalPadding: 15,
              leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 46,
                  width: 46),
              title: const Text('Festa lorem ipsum'),
              subtitle: const Text('Rua exemplo - SP'),
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
                              builder: (context) =>
                                  const PaymentMethodsPage())),
                      child: const Icon(Icons.credit_card)),
                  _buildCustomElevatedButton(
                      onPressed: () {
                        _wifiAlertDialog();
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
              // indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
              labelColor: Theme.of(context).colorScheme.secondary,
              labelStyle: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              tabs: const [
                Tab(text: 'Início'),
                Tab(text: 'Cardápio'),
                Tab(text: 'Lista'),
                Tab(text: 'Sobre'),
              ],
            )
          ]),
    );
  }

  Widget _closeButton() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const CircleAvatar(
        radius: 9,
        backgroundColor: Color.fromRGBO(126, 134, 158, 0.25),
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }

  void _wifiAlertDialog() {
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
            title: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Lorem ipsum nome wifi',
                    style: textTheme.headline4!.copyWith(
                        color: colorScheme.surface,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Positioned(top: 0, right: 0, child: _closeButton()),
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
                  // width: 90,
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
            actions: [
              TextUnderlinedButton(
                onTap: _editWifiAlertDialog,
                title: 'Editar',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).primaryColor),
              ),
            ],
          );
        }));
  }

  void _editWifiAlertDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: colorScheme.onBackground,
            content: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFormField(
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
                      CustomTextFormField(
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
                      CustomTextFormField(
                        title: 'Senha',
                        hintText: '0000-0000',
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
                Positioned(top: 0, right: 0, child: _closeButton()),
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
