import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _img = prefs.getString('ff_img') ?? _img;
  }

  SharedPreferences prefs;

  String _img =
      'https://lh3.googleusercontent.com/fzJGA70cuZfqAKh0_gjZbUQnlCxE224I6FXaI0-Ly3ebzlKKthmKDQsvYbmvUpMzvIabnWjYy6cuyaPJWxNMLDEXDLuKixbyvm9VN83fFPtuqtpHB_NXleoO3xKqXR9-UDN9gah9RWy4oUu8-60rXWC0CMYSbIRyK7tTd04PQN2-pOjRt-0sY8n1dJXklOvUlPhZY6DskcHo7ed1dMCCogQpkW_3-_sUmUM3OesJ0SysYky0aKqtkp126JGSy3sJTkwh2TEBcXgKLHi_JkrZKx6TQNsYYyhfDU-29t5liRWnmEd506HSDf0cQtLaEBnx8fFIj8Ur51KcN2JDYHTZVJRMJf1BTfXx8YAAB9K7Hq3hgU1x0y5pwZPSLeS5jnz0BJlGKnqP3ldRdi2dc7vnJslUSLA44rHp_kKGaIhw-mqsrgCiZF4A2EN85RuR4fyr5J-H3cXbIUcaB91Ou9rutVoxqYKZfc7jQAQrjdev9oo30WAv15gx2GYivcUnw3IU9WJoZHAyANjU8LBMVPnXfiwLc2TEdCfRB0ElMyAWpj25xzPy1WII74aQbyENAhtSrUBtIYyjnHheSyw_liGZL0pF8jeNLWAhRm6XqeMOSpgrY4jm25zqvtWUnV3jY9nivCYx8fzCB0QvVDAg7N3P1B8AMXWw6VMO6cqnh1pJ1EZLzqA4BUQEwKx910KNwoDL0Mg86IVN0cwvRekXivdOZuGnwqdFRGXdgUQso_s4A1nDvi3AIpx50MmFVxdVxw=w444-h592-no?authuser=0';
  String get img => _img;
  set img(String _value) {
    _img = _value;
    prefs.setString('ff_img', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
