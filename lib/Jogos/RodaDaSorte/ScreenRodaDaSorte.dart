/*
     Arquivo exclusivo para tela da roda da sorte
 */

import 'package:casa_da_sorte/Helper/UIHelper.dart';
import 'package:flutter/material.dart';
import 'package:casa_da_sorte/Modulos/PainelSuperior.dart';

import 'package:casa_da_sorte/Jogos/RodaDaSorte/AnimacaoRodaDaSorte.dart';


class ScreenRodaDaSorte extends StatefulWidget {
  const ScreenRodaDaSorte({Key? key}) : super(key: key);

  @override
  _ScreenRodaDaSorteState createState() => _ScreenRodaDaSorteState();
}

class _ScreenRodaDaSorteState extends State<ScreenRodaDaSorte> {
  @override
  Widget build(BuildContext context) {
    // Obtenha o provedor de autenticação do contexto

    return Scaffold(
      appBar: AppBar(
        title: const Text('Roda da Sorte'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          PainelSuperior(context),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    Container(
                      width: 350,
                      height: 380,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.arrow_downward),
                          RodaDaSorteWidget(),
                        ],
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 100,
                      margin: const EdgeInsets.only(top: 10),
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
                            child: const TextField(
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
                              onPressed: () async {},
                              child: const Text('OK'),
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
      bottomNavigationBar: CustonButtonApp(context),
    );
  }
}
