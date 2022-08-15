import 'package:flutter/material.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_outline_input_text_widget.dart';
import '../../shared/components/events_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //TODO: verificar alinhamnento
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
      bottomRightRadius: 30,
      height: 171,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 30),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Favoritos',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18, top: 22),
                  child: CustomOutlineInputText(),
                )
              ]),
        ),
      ),
    );
  }
}
