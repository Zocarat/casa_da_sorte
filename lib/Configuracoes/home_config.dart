import 'package:casa_da_sorte/Configuracoes/sharedPreferences_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/DadosDoJogo.dart';
import 'package:casa_da_sorte/Helper/UIHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScreenConfig extends StatefulWidget {
  const ScreenConfig({super.key});

  @override
  State<ScreenConfig> createState() => _ScreenConfigState();
}

class _ScreenConfigState extends State<ScreenConfig>  {

  late PreferencesServicesConfig _preferencesServicesConfig;
  bool _soundEnable =  PreferencesServicesConfig().getSoundEnable();
  bool _modoEscuroEneble = false ;

  void initState (){
    super.initState();
    _preferencesServicesConfig = PreferencesServicesConfig();
    _loadPreferences();
  }

  void _loadPreferences () async {

    await _preferencesServicesConfig.init();
    setState(() {
      _soundEnable = _preferencesServicesConfig.getSoundEnable();
    });
  }

  Future<void> _savePreferences() async {
    await _preferencesServicesConfig.setSoundEnable(_soundEnable);
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Configurações '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Som',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Switch(
                      value: _soundEnable,
                      onChanged: (value) {
                        setState(() {
                          _soundEnable = value;
                          _savePreferences();
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Modo Escuro'),
                    trailing: Switch(
                      value: _modoEscuroEneble,
                      onChanged: ( value ) {
                        setState(() {
                          _modoEscuroEneble = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustonButtonApp(context),
    );
  }
}
