import 'package:iva_app/home/login/data/models/usuario.model.dart';

abstract class ICadastroDataSource {
  Future cadastrarUsuario(UsuarioModel usuario);
}
