import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/promotion_model.dart';

class PromotionsController extends ChangeNotifier {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  DateTime date = DateTime.now();
  String _name = '';
  bool _isExpanded = false;
  UniqueKey expansionTileKey = UniqueKey();

  final List<PromotionModel> _promotions = List.generate(3, (index) {
    final date = DateTime.now();

    return PromotionModel(
        id: 'pomotion_$index',
        title: 'Promoção $index',
        activated: false,
        startDateTime: date,
        endDateTime: DateTime(
          date.year,
          date.month,
          date.day,
          date.hour + 1,
        ));
  });

  List<PromotionModel> get promotions => [..._promotions];

  get isExpanded => _isExpanded;
  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void toggleActivatedOf(String idPromotion) {
    final index =
        _promotions.indexWhere((promotion) => promotion.id == idPromotion);
    _promotions[index].activated = !_promotions[index].activated;
    notifyListeners();
  }

  void name(String value) => _name = value;

  String? onValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, preencha este campo.';
    }
    return null;
  }

  void addPromotion() {
    final dateTimeWithStartTime = DateTime(
        date.year, date.month, date.day, startTime.hour, startTime.minute);
    final newPromotion = PromotionModel(
        id:
            'new_pomotion_${_name}_${DateFormat.Hm().format(dateTimeWithStartTime)}',
        title: 'Promoção $_name',
        activated: true,
        startDateTime: dateTimeWithStartTime,
        endDateTime: DateTime(
            date.year, date.month, date.day, endTime.hour, endTime.minute));
    _promotions.add(newPromotion);
    cleanAddFields();

    notifyListeners();
  }

  void cleanAddFields() {
    startTime = TimeOfDay.now();
    endTime = TimeOfDay.now();
    date = DateTime.now();
    _name = '';
    _isExpanded = false;
    expansionTileKey = UniqueKey();
  }
}
