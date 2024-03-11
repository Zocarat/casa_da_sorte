/*preferences _services
===============================================================================
 Classe criada para atender as necessidade de manter dados persistentes
 na config.
      Mantendo uma programação mais modular

 ==============================================================================

*/

import 'package:shared_preferences/shared_preferences.dart';
import 'package:casa_da_sorte/Configuracoes/sharedPreferences_config.dart';

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
