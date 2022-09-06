import 'package:flutter/material.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_outline_search_widget.dart';
import '../../shared/components/events_widget.dart';
import '../../shared/utils/components_utils.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          itemCount: 3,
          itemBuilder: (context, index) {
            return EventsWidget(
              favorite: true,
              onTap: () {},
            );
          }),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      bottomRightRadius: 30,
      height: 151,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      ComponentsUtils.buildArrowBack(context),
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
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18, bottom: 16, right: 8),
                  child: CustomOutlineSearch(),
                )
              ]),
        ),
      ),
    );
  }
}
