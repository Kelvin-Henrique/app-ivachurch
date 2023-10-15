import 'package:mobx/mobx.dart';

part 'loader.controller.g.dart';

class LoaderController = _LoaderControllerBase with _$LoaderController;

abstract class _LoaderControllerBase with Store {
  @observable
  bool loading = false;

  int qtdRequest = 0;

  @action
  startLoading() {
    qtdRequest++;
    loading = true;
  }

  @action
  stopLoading() {
    if (qtdRequest <= 0) return;

    qtdRequest--;
    
    if (qtdRequest > 0) return;

    loading = false;
  }
}
