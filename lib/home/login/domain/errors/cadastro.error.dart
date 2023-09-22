
import 'package:flutter/foundation.dart';
import '../../../../core/errors/failures.dart';

class CadastroFailure extends Failure {
  final String message;
  CadastroFailure({required this.message});
}
