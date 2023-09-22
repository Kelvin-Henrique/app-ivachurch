abstract class Failure implements Exception {
  String get message;
}

class ServerFailure extends Failure {
  @override
  String get message => "Erro ao conectar no servidor favor verifique sua conexão e tente novamente mais tarde!";
}

class OfflineFailure extends Failure {
  @override
  String get message => "Sistema indisponível no momento. Por favor, tente novamente mais tarde";
}

class ErrorFailure extends Failure {
  @override
  String get message => 'Erro não esperado!';
}
