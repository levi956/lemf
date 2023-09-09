class EnvironmentSetup {
  static void run({required Environment environment}) {
    env = environment;
  }

  static String get baseUrl => env == Environment.live ? _liveUrl : _testUrl;
  static String get envString => env == Environment.live ? "Live" : "Staging";

  static late Environment env;
  static final String _liveUrl =
      "https://6294f25b63b5d108c1977427.mockapi.io/api/v1/".trim();
  static final String _testUrl =
      "https://6294f25b63b5d108c1977427.mockapi.io/api/v1/".trim();
}

enum Environment { live, test }
