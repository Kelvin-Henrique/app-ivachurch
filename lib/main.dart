import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iva_app/app.module.dart';
import 'package:iva_app/home/presentation/pages/home.page.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
    child: MaterialApp(
      home:  HomePage(),
    ),
  ));
  
}

