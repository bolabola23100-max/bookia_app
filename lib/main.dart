import 'package:bookia/app/MyApp.dart';
import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupServiceLocator();
  DioProvider.init();
  await SharedPref.init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar'), Locale('zh')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MainApp(),
    ),
  );
}
