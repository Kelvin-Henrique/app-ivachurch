import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iva_app/app.module.dart';
import 'package:iva_app/core/locator/locator.dart';
import 'package:iva_app/home/presentation/pages/bem-vindo.page.dart';
import 'dart:io';

void main() {
  setupLocator();
  // Desative a verificação de SSL temporariamente
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Para desktop
    HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  } else {
    // Para dispositivos móveis (Android/iOS)
    HttpOverrides.global = MyHttpOverrides();
  }

  runApp(ModularApp(
    module: AppModule(),
    child: MaterialApp(
      home: BemVindoPage(),
    ),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
