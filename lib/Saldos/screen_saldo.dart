
import 'package:flutter/material.dart';
import 'package:casa_da_sorte/Helper/UIHelper.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:casa_da_sorte/Configuracoes/audio_players.dart';


class ScreenSaldo extends StatefulWidget {
  const ScreenSaldo({super.key});

  @override
  State<ScreenSaldo> createState() => _ScreenSaldoState();
}

class _ScreenSaldoState extends State<ScreenSaldo> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(' Adicionar Saldos'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(

          children: [
            ElevatedButton(onPressed: () async {





              AudioServices.PlaySong('m.mp3');








            }, child: Text('ok')),
          ],
        ),

      ),
      bottomNavigationBar: CustonButtonApp(context),

    );
  }

  Future<void> clearCache() async {
    DefaultCacheManager().emptyCache();
    print('Cache cleared');
  }

}
