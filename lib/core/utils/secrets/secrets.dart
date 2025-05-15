class Secrets {
  Secrets._internal();
  static final Secrets _instance = Secrets._internal();

  factory Secrets() => _instance;

  final String email = "test@test.com";
  final String pass = "123456";
}
