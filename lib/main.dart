import 'package:cats/shared/atoms/custom_text.dart';
import 'package:cats/shared/themes/custom_light_theme.dart';
import 'package:cats/views/landing/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  //flutter pub run flutter_native_splash:create
  //flutter run --dart-define-from-file=app_config_dev.json
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats',
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme.themeData(context),
      home: Scaffold(
        appBar: AppBar(
          title: const CustomText(text: 'Razas de gatos'),
          centerTitle: true,
        ),
        body: const LandingView(),
      ),
    );
  }
}
