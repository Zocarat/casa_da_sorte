/*
     Arquivo exclusivo para tela da roda da sorte
 */

import 'package:flutter/material.dart';
import 'package:casa_da_sorte/Modulos/PainelSuperior.dart';
import 'package:casa_da_sorte/Modulos/BarraMenuInferior.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/DadosDoJogo.dart';
import 'package:casa_da_sorte/Jogos/RodaDaSorte/AnimacaoRodaDaSorte.dart';

class ScreenRodaDaSorte extends StatefulWidget {
  const ScreenRodaDaSorte({Key? key}) : super(key: key);

  @override
  _ScreenRodaDaSorteState createState() => _ScreenRodaDaSorteState();
}

class _ScreenRodaDaSorteState extends State<ScreenRodaDaSorte> {
  String _saldoJogo = DadosDoJogo().getSaldoString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Roda da Sorte'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          PainelSuperior(_saldoJogo),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    Container(
                      width: 350,
                      height: 380,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.arrow_downward),
                          RodaDaSorteWidget(),
                        ],
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 100,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 180,
                            height: 50,
                            margin: EdgeInsets.only(right: 30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Valor Aposta',
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('OK'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BarraMenuInferior(),
    );
  }
}
