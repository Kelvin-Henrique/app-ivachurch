import 'package:flutter_modular/flutter_modular.dart';
import 'package:iva_app/home/presentation/pages/home.page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => HomePage(),
          transition: TransitionType.noTransition,
        ),
      ];
}
