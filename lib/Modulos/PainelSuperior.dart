/*
    Este módulo tem o objetivo de construir o painel superior, aonde
    serão exibidos informações como saldo.
    A ideia neste momento é fazer com que ele seja sempre exibido nas telas,
    assim como a barra de menus inferiores


 */

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:casa_da_sorte/Home/ScreenHomePage.dart';
import 'package:provider/provider.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/provider.dart';
import 'package:intl/intl.dart';

Widget PainelSuperior(BuildContext context ) {

  final authProvider = Provider.of<AuthProviderUser>(context);
  String _saldoJogo = authProvider.isAuthenticated
      ? authProvider.user?.saldo.toString() ?? '0.00'
      : '0.00';
  double saldoInteger = double.parse(_saldoJogo);
  NumberFormat formato = NumberFormat('#,##0.00', 'pt_BR');
  String saldoFormatado = formato.format(saldoInteger);

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
        Text('R\$  $saldoFormatado',
        style: TextStyle(
          fontSize: 35
        ),
        ),
      ],
    ),
  );
}
