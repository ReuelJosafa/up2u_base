import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComponentsUtils {
  static buildSwitch(BuildContext context,
      {required bool value, required void Function(bool)? onChanged}) {
    return Platform.isAndroid
        ? Switch(value: value, onChanged: onChanged)
        : CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: Theme.of(context).primaryColor);
  }
}
