abstract class Failure {
  final String errMsg;

  Failure({required this.errMsg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMsg});
}
