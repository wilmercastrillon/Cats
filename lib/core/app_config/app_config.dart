class AppConfig {
  AppConfig._();

  static const String enviroment = String.fromEnvironment('enviroment');
  static const String breedsUrl = String.fromEnvironment('breeds_url');
  static const String imagesUrl = String.fromEnvironment('images_url');
  static const String apiKey = String.fromEnvironment('api_key');
}
