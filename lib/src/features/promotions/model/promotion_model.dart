import 'package:intl/intl.dart';

class PromotionModel {
  final String id;
  final String title;
  final DateTime startDateTime;
  final DateTime endDateTime;
  bool activated;

  PromotionModel({
    required this.id,
    required this.title,
    required this.startDateTime,
    required this.endDateTime,
    required this.activated,
  });

  String get dateTimeAsString {
    final formattedDate = DateFormat('dd/MM').format(startDateTime);
    final formattedStartTime =
        DateFormat.Hm().format(startDateTime).replaceFirst(':', 'h');
    final formattedEndTime =
        DateFormat.Hm().format(endDateTime).replaceFirst(':', 'h');
    final formattedHourPrefix = startDateTime.hour <= 1 ? 'da' : 'das';
    final formattedHourMiddle = endDateTime.hour <= 1 ? 'à' : 'às';
    return '$formattedDate $formattedHourPrefix $formattedStartTime $formattedHourMiddle $formattedEndTime';
  }

  String get activatedAsString {
    if (activated) {
      return 'Ativado';
    }
    return 'Desativado';
  }
}
