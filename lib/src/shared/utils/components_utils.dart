import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComponentsUtils {
  /// Controi um widget Switch com base na plataforma em que o app está executando (Switch - Android ou Cupertino Switch - IOs).
  static Widget buildSwitch(BuildContext context,
      {required bool value, required void Function(bool)? onChanged}) {
    return Platform.isAndroid
        ? Switch(value: value, onChanged: onChanged)
        : CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: Theme.of(context).primaryColor);
  }

  static Widget buildArrowBack(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Icon(Icons.arrow_back_ios_new_outlined),
    );
  }
}
