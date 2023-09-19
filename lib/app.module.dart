import 'package:flutter_modular/flutter_modular.dart';
import 'package:iva_app/home/home.module.dart';
import 'package:iva_app/home/login/login.module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/', module: LoginModule()),
      ];
}
