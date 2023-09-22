

import 'package:dartz/dartz.dart';
import 'package:iva_app/core/errors/failures.dart';
import 'package:iva_app/home/login/data/models/usuario.model.dart';
import 'package:iva_app/home/login/domain/entities/usuario.entity.dart';

abstract class ICadastroRepository {
  Future<Either<Failure, void>> cadastrarUsuario(UsuarioModel usuario);
}