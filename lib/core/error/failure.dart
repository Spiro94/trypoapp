abstract class Failure {
  final String message;

  Failure(this.message);
  List<Object> get props => [message];
}

//General Failures
class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}
