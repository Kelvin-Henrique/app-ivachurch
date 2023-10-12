import 'dart:convert';

import 'package:iva_app/home/login/data/models/usuario.model.dart';
import 'package:iva_app/home/login/domain/repositories/icadastro.repository.dart';
import 'package:http/http.dart' as http;

class CadastroRepository extends ICadastroRepository {
  CadastroRepository();

  @override
  Future<bool> cadastrarUsuario(UsuarioModel usuario) async {
    try {
    final jsonData = jsonEncode(usuario.toJson());

      final response = await http.post(
        Uri.parse('https://10.0.2.2:7181/Usuario/cadastrar'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
