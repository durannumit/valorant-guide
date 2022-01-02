class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://valorant-api.com/v1";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";

  // get agents
  static const String agents = baseUrl + "/agents";
}
