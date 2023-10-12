import 'package:iva_app/home/login/data/models/usuario.model.dart';

abstract class ICadastroRepository {
  Future<bool> cadastrarUsuario(UsuarioModel usuario);
}
