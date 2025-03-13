import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'services/localization.dart';
import 'views/home_screen.dart';
import 'views/ar_view_screen.dart';
import 'models/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Restaurant',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', ''), Locale('ar', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      routes: {
        '/ar-view':
            (context) => ARViewScreen(
              // Remove const here
              product: ModalRoute.of(context)!.settings.arguments as Product,
            ),
      },
    );
  }
}
