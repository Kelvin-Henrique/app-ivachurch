import 'package:iva_app/home/login/domain/entities/usuario.entity.dart';

class UsuarioModel extends UsuarioEntity {
  const UsuarioModel(
      {
      final String? nome,
      final String? email,
      final String? celular,
      final String? senha})
      : super(nome: nome, email: email, celular: celular, senha: senha);

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      nome: json['nome'],
      email: json['email'],
      celular: json['celular'],
      senha: json['senha'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'celular': celular,
      'senha': senha,
    };
  }
}
