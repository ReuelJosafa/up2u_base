import 'package:flutter/material.dart';

class CommomPopupTitle extends PopupMenuItem {
  final String title;
  final TextTheme textTheme;

  CommomPopupTitle({Key? key, required this.title, required this.textTheme})
      : super(
          key: key,
          height: 18,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          enabled: false,
          onTap: null,
          child: Text(
            title,
            style: textTheme.bodyText1!.copyWith(
                color: const Color(0xFF49494B), fontWeight: FontWeight.w600),
          ),
        );
}
