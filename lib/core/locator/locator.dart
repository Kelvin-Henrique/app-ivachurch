
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:iva_app/home/loader/domain/usecases/loader.controller.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  Intl.defaultLocale = 'pt_BR';
  locator.registerLazySingleton(() => LoaderController());
}
