import 'package:flutter/material.dart';

import 'features/auth/auth_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: _buildTheme(),
      home: const AuthPage(),
    );
  }

  ThemeData _buildTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF272727),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFD3A62A),
        secondary: Color(0xFF4C3513),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        surface: Color(0xFF0D0D0D),
        onBackground: Colors.white,
      ),
      toggleableActiveColor: const Color(0xFFD3A62A),
      splashColor: const Color(0xFF4C3513),
      buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFFBBC05),
          colorScheme: ColorScheme.dark(
            outline: Color(0xFFFBBC05),
            background: Color(0xFFFBBC05),
          )),
      // accentColor: shrineBrown900,
      primaryColor: const Color(0xFFD3A62A),
      // cardColor: shrineBackgroundWhite,
      // textSelectionColor: shrinePink100,
      // errorColor: shrineErrorRed,
      // primaryIconTheme: _customIconTheme(base.iconTheme),
      textTheme: _textTheme(base.textTheme),
      primaryTextTheme: _textTheme(base.primaryTextTheme),
      // accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      // iconTheme: _customIconTheme(base.iconTheme),
    );
  }

  TextTheme _textTheme(TextTheme base) {
    return base
        .copyWith(
          caption:
              base.caption!.copyWith(fontSize: 14, fontWeight: FontWeight.w300),
          button: base.button!.copyWith(
              fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
          headline1: base.headline1!.copyWith(
              fontSize: 24.0, fontWeight: FontWeight.w400, color: Colors.white),
          headline2: base.headline2!.copyWith(
              fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.white),
          headline3: base.headline3!.copyWith(
              fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
          headline4: base.headline4!.copyWith(
              fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
          headline5: base.headline5!.copyWith(
              fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.white),
          bodyText1: base.bodyText1!.copyWith(
              fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white),
          bodyText2: base.bodyText2!.copyWith(
              fontSize: 10.0, fontWeight: FontWeight.w500, color: Colors.white),
          subtitle2: base.subtitle2!.copyWith(
              fontSize: 8.0, fontWeight: FontWeight.w400, color: Colors.white),
        )
        .apply(fontFamily: 'Poppins', bodyColor: Colors.white);
  }
}
