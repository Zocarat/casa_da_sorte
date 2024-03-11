import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServicesConfig {
  late SharedPreferences _preferences;

    Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  //=============================  [ Som ]  ==================================
  // Configuração de som
  bool getSoundEnable() {
      print('Get Sound Config foi acionada!');
    return _preferences.getBool('soundEnable') ?? true;

  }
  Future<void> setSoundEnable(bool value) async {

    print('Valor config som foi atualizada $value');
    await _preferences.setBool('soundEnable', value);

  }
  // =========================================================================

}
