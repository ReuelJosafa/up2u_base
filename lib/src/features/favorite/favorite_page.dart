import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/components/alert_dialog_action_button_widget.dart';
import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_outline_search_widget.dart';
import '../../shared/components/events_widget.dart';
import '../../shared/controllers/local_of_events_list_controller.dart';
import '../../shared/utils/components_utils.dart';
import '../events_details/events_detail_page.dart';

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
      body: Consumer<LocalOfEventListController>(builder: (_, controller, __) {
        if (controller.localOfEventsFavorites.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text("A lista de favoritos está vazia",
                  style: Theme.of(context).textTheme.headline3),
            ),
          );
        }
        return ListView.builder(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            itemCount: controller.localOfEventsFavorites.length,
            itemBuilder: (context, index) {
              final localOfEvent = controller.localOfEventsFavorites[index];
              return EventsWidget(
                localOfEvent: localOfEvent,
                onFavorite: () {
                  _showRemoveAlertDialog(localOfEvent.title).then((value) {
                    if (value != null && value == true) {
                      controller.toggleFavorite(localOfEvent.id);
                    }
                  });
                },
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const EventsDetailPage(isAnAdministrator: false))),
              );
            });
      }),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      // bottomRightRadius: 30,
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

  Future<T?> _showRemoveAlertDialog<T>(String title) {
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
              'Remover favorito?',
              style: textTheme.headline4!.copyWith(
                  color: colorScheme.surface, fontWeight: FontWeight.w600),
            ),
            content: Text.rich(
              TextSpan(
                  text: 'Você tem certeza que deseja remover o local ',
                  children: [
                    TextSpan(
                        text: title,
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    const TextSpan(
                      text: ' da lista de favoritos?',
                    ),
                  ]),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w300, color: Colors.black),
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              AlertDialogActionButton(
                  onPressed: () => Navigator.pop(context, false),
                  title: 'Cancelar',
                  outlineBorder: true),
              const SizedBox(width: 8),
              AlertDialogActionButton(
                  onPressed: () => Navigator.pop(context, true),
                  title: 'Remover',
                  filled: true),
            ],
          );
        })).then((value) => value);
  }
}
