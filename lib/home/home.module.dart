import 'package:flutter_modular/flutter_modular.dart';
import 'package:iva_app/home/presentation/pages/bem-vindo.page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/bem-vindo',
          child: (_, args) => BemVindoPage(),
          transition: TransitionType.noTransition,
        ),
      ];
}
