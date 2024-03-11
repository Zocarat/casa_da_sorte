import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/DadosDoJogo.dart';
import 'package:casa_da_sorte/Helper/UIHelper.dart';

class ScreenConfig extends StatefulWidget {
  const ScreenConfig({super.key});

  @override
  State<ScreenConfig> createState() => _ScreenConfigState();
}

class _ScreenConfigState extends State<ScreenConfig> {
  bool _soundEnable = true; // estado para rastrear é confihuração de sim
  bool _modoEscuroEneble = false;

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
                    title: Text(
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
