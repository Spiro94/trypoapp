abstract class UseCase<Type, Params> {
  Type call(Params params);
}

class NoParams {}

class Params {
  final String query;
  const Params(this.query);
}
