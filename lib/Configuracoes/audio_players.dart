
///      Esta clase é responsavel por funções relacionadas a audio
///
///
///
import 'package:casa_da_sorte/Configuracoes/sharedPreferences_config.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioServices {


   static Future<void> PlaySong (String local) async {

     late PreferencesServicesConfig _prefConfig = PreferencesServicesConfig();
     await _prefConfig.init();
     bool _enableAudio = await _prefConfig.getSoundEnable();

     if (_enableAudio == true) {
       AudioPlayer audioPlayer = AudioPlayer();
       await audioPlayer.stop();
       await audioPlayer.play(AssetSource(local));
     }

  }








}