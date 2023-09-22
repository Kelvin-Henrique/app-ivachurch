import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:iva_app/home/login/data/models/usuario.model.dart';
import 'package:iva_app/home/login/domain/entities/usuario.entity.dart';
import 'package:iva_app/home/login/domain/errors/cadastro.error.dart';
import 'package:iva_app/home/login/domain/repositories/icadastro.repository.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/platform/network-info/inetwork-info.dart';

class CadastroRepository extends ICadastroRepository {
  final ICadastroRepository ?datasource;
  final INetworkInfo ?networkInfo;

  CadastroRepository({@required this.datasource, @required this.networkInfo});

  @override
  Future<Either<Failure, void>> cadastrarUsuario(UsuarioModel usuario) async {
    try {
      if (await networkInfo!.isConnected) {
        var result = await datasource!.cadastrarUsuario(usuario);
        return Right(result);
      } else {
        throw ServerException();
      }
    } on SocketException {
      return Left(ServerFailure());
    } on FormatException {
      return Left(ServerFailure());
    } on OfflineFailure {
      return Left(OfflineFailure());
    } on DioError catch (e) {
      return Left(CadastroFailure(message: e.message));
    } catch (e) {
      return Left(ErrorFailure());
    }
  }
 

}
