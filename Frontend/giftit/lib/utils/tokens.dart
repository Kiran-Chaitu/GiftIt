import 'package:flutter_dotenv/flutter_dotenv.dart';

class Tokens {
  static final  googleApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
} 