import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:iva_app/home/login/data/models/usuario.model.dart';

import 'icadastro.datasource.dart';

class CadastroDataSource extends ICadastroDataSource {
  final Dio? dio;

  CadastroDataSource({@required this.dio});


 @override
 Future cadastrarUsuario(UsuarioModel usuario) async {
  var response = await dio?.post("https://5baf-2804-14d-78a6-adf8-2cda-2e7f-2821-a1c3.ngrok-free.app/Usuario/cadastrar", data: {
    "nome": usuario.nome,
    "email": usuario.email,
    "celular": usuario.celular,
    "senha": usuario.senha,
  });
  return response;
 }

}
