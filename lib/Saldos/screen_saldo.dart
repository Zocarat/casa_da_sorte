

import 'package:flutter/material.dart';


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


    );
  }
}
