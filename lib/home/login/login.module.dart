import 'package:flutter_modular/flutter_modular.dart';
import 'package:iva_app/home/login/presetation/pages/cadastro.page.dart';
import 'package:iva_app/home/login/presetation/pages/login.page.dart';
import 'package:iva_app/home/presentation/pages/home.page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
         ChildRoute(
          '/',
          child: (_, args) => LoginPage(),
          transition: TransitionType.noTransition,
        ), 
        ChildRoute(
          '/cadastrar',
          child: (_, args) => CadastroPage(),
          transition: TransitionType.noTransition,
        ), 
      ];
}
