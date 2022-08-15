import 'package:flutter/material.dart';

import '../../shared/components/custom_elevated_button_widget.dart';
import '../../shared/contants/constant_app_images.dart';

class UseTermsPage extends StatefulWidget {
  final bool isOnlyVisualization;
  const UseTermsPage({Key? key, this.isOnlyVisualization = false})
      : super(key: key);

  @override
  State<UseTermsPage> createState() => _UseTermsPageState();
}

class _UseTermsPageState extends State<UseTermsPage> {
  @override
  Widget build(BuildContext context) {
    widget.isOnlyVisualization;
    return Scaffold(
      appBar: _cunstomAppBar(),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(ConstantAppImages.background, height: 352),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 22, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor '
                      'incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum'
                      'exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi '
                      'consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu '
                      'fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui '
                      'officia deserunt mollit anim id est laborum.\n\n'
                      'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor '
                      'incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum'
                      'exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi '
                      'consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu '
                      'fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui '
                      'officia deserunt mollit anim id est laborum.',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 22),
                  CustomElevatedButton(
                      title: widget.isOnlyVisualization ? 'Voltar' : 'Aceitar',
                      onPressed: () {
                        Navigator.pop(context, true);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _cunstomAppBar() {
    return AppBar(
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          }),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text('Termos de uso',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontWeight: FontWeight.w600)),
      centerTitle: true,
      elevation: 0,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 26),
              color: Colors.white,
              height: 1)),
    );
  }
}
