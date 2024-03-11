/*
    Este módulo tem o objetivo de construir o painel superior, aonde
    serão exibidos informações como saldo.
    A ideia neste momento é fazer com que ele seja sempre exibido nas telas,
    assim como a barra de menus inferiores


 */

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:casa_da_sorte/Home/ScreenHomePage.dart';



Widget PainelSuperior(String saldoJogador) {




  return Container(
    width: 350,
    height: 120,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Text(
          'Saldo:',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text('R\$  $saldoJogador',
        style: TextStyle(
          fontSize: 35
        ),
        ),
      ],
    ),
  );
}
