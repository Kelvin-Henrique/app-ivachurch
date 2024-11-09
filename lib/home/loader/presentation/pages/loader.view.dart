import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';

import 'package:iva_app/home/loader/domain/usecases/loader.controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loader extends StatefulWidget {
  final Widget child;

  const Loader({Key? key, required this.child}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  final controller = GetIt.I.get<LoaderController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => ModalProgressHUD(
            color: Colors.white,
            progressIndicator: SpinKitThreeBounce(
              color: Theme.of(context).primaryColor,
              size: 50.0,
            ),
            inAsyncCall: controller.loading,
            child: widget.child));
  }
}
