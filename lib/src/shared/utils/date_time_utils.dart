import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cupertino_utils.dart';

class DateTimeUtils {
  /// Retorna o horário [timeOfDay] no modelo brasileiro (ex: 18h13).
  static String toPtBrFormat(BuildContext context, TimeOfDay timeOfDay) {
    return timeOfDay.format(context).replaceFirst(RegExp(r':'), 'h');
  }

  /// Abre um popup com o seletor de horário do Material design ou um modal com o seletor de horário
  /// do IOs design.
  static Future<void> chooseTime(
    BuildContext context, {
    required TimeOfDay timeOfDay,
    required void Function(TimeOfDay newTime) onTimeChanged,
  }) async {
    if (Platform.isAndroid) {
      timeOfDay = await showTimePicker(
            context: context,
            initialTime: timeOfDay,
          ) ??
          timeOfDay;

      onTimeChanged(timeOfDay);
    } else {
      final dateTimeNow = DateTime.now();
      CupertinoUtils.showModalDialog(
        context,
        CupertinoDatePicker(
          initialDateTime: DateTime(
            dateTimeNow.year,
            dateTimeNow.month,
            dateTimeNow.day,
            timeOfDay.hour,
            timeOfDay.minute,
          ),
          mode: CupertinoDatePickerMode.time,
          use24hFormat: true,
          onDateTimeChanged: (DateTime newDate) {
            onTimeChanged(TimeOfDay.fromDateTime(newDate));
          },
        ),
      );
    }
  }

  /// Abre um popup com o seletor de data do Material design ou um modal com o seletor de data
  /// do IOs design.
  static Future<void> chooseData(
    BuildContext context, {
    required DateTime initialDate,
    required void Function(DateTime newDate) onDateChanged,
  }) async {
    if (Platform.isAndroid) {
      final theme = Theme.of(context);
      initialDate = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime.now().subtract(const Duration(days: 7)),
            lastDate: DateTime(2101),
            builder: (context, child) {
              return Theme(
                  data: ThemeData.dark().copyWith(
                    colorScheme: ColorScheme.dark(
                      primary: theme.primaryColor,
                      onPrimary: theme.colorScheme.onSurface,
                      surface: theme.colorScheme.surface,
                      onSurface: theme.colorScheme.onSurface,
                    ),
                    dialogBackgroundColor: const Color(0xFF272727),
                  ),
                  child: child!);
            },
          ) ??
          initialDate;

      onDateChanged(initialDate);
    } else {
      CupertinoUtils.showModalDialog(
          context,
          CupertinoDatePicker(
            minimumYear: DateTime.now().year - 1,
            initialDateTime: initialDate,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            onDateTimeChanged: onDateChanged,
          ),
          isDate: true);
    }
  }
}
