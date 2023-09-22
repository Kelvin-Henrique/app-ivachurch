import 'package:equatable/equatable.dart';

class UsuarioEntity extends Equatable {
  final int? id;
  final String? nome;
  final String? email;
  final String? celular;
  final String? senha;

  const UsuarioEntity({this.id, this.nome, this.email, this.celular, this.senha})
      : super();

  @override
  List<Object> get props => [];
}
