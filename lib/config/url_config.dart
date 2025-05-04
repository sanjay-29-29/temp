class Config {
  static const String environment =
      String.fromEnvironment('ENV', defaultValue: 'stage');

  static const Map<String, Map<String, String>> _config = {
    'dev': {
      'baseUrl': 'http://192.168.249.6:5000',
    },
    'stage': {
      'baseUrl': 'https://mrinnovations.in',
      // 'baseUrl': 'http://192.168.12.1:5000',
    },
    'prod': {
      'baseUrl': 'https://buildtechleadflow.in',
    },
  };

  static String get baseUrl => _config[environment]!['baseUrl']!;
}


