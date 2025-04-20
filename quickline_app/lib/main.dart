import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quickline_app/l10n/l10n.dart';
import 'package:quickline_app/screens/auth/auth_scroll_page.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const QuickLineApp());
}

class QuickLineApp extends StatefulWidget {
  const QuickLineApp({super.key});

  @override
  State<QuickLineApp> createState() => _QuickLineAppState();
}

class _QuickLineAppState extends State<QuickLineApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickLine App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      // home: AuthScrollPage(
      //   onLocaleChange: setLocale,
      // ),
    );
  }
}