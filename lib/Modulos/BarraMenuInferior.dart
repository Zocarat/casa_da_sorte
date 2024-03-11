import 'package:casa_da_sorte/Configuracoes/home_config.dart';
import 'package:flutter/material.dart';
import 'package:casa_da_sorte/Saldos/screen_saldo.dart';

class BarraMenu extends StatefulWidget {
  const BarraMenu({super.key});

  @override
  State<BarraMenu> createState() => _BarraMenuState();
}

class _BarraMenuState extends State<BarraMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BottomAppBar(
            child: Container(
              width: 300,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.home_filled)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScreenSaldo()));
                      },
                      icon: const Icon(Icons.monetization_on)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScreenConfig()));
                      },
                      icon: const Icon(Icons.dashboard_customize)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
