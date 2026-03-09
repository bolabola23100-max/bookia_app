import 'package:bookia/app/MyApp.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:flutter/material.dart';

void main() {
  DioProvider.init();

  runApp(const MainApp());
}
