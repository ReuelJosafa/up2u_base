import 'package:flutter/cupertino.dart';
import 'package:up2u_base/src/shared/models/local_of_event.dart';

class LocalOfEventListController extends ChangeNotifier {
  final List<LocalOfEvent> _localOfEvents = List.generate(
      3,
      (index) => LocalOfEvent(
          id: 'local_$index',
          title: 'Exemplo $index',
          address: 'Rua exemplo $index',
          type: 'Balala',
          imageUrl: 'images/rectangle8.jpg',
          favorite: index == 0,
          promotion: index == 0 || index == 2));

  List<LocalOfEvent> get localOfEvents => [..._localOfEvents];

  List<LocalOfEvent> get localOfEventsFavorites =>
      [..._localOfEvents.where((event) => event.favorite)];

  void toggleFavorite(String id) {
    final index = _localOfEvents.indexWhere((local) => local.id == id);
    _localOfEvents[index].favorite = !_localOfEvents[index].favorite;
    notifyListeners();
  }
}
