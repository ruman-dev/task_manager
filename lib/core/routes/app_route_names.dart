class AppRouteNames {
  AppRouteNames._internal();

  static final AppRouteNames _instance = AppRouteNames._internal();

  factory AppRouteNames() => _instance;

  final String login = "/login";
  final String home = "/home";
  final String createTask = "/createTask";
}
