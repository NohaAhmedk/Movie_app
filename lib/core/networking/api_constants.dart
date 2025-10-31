import 'package:envied/envied.dart';
part 'api_constants.g.dart';

@Envied(path: 'env/.env')
class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "live_y371tvAjzdTd87oJ76s4RJkV9hyytZ0mWmlXwfHqhfmIlJY2NOVPxee70Cjw0v1g";
  @EnviedField(obfuscate: true)
  static final String apiToken =_ApiConstants.apiToken;
}
