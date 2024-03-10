import 'dart:math';
import 'package:casa_da_sorte/Dados/DadosJogo/DadosDoJogo.dart';


import 'package:flutter/material.dart';


class RodaDaSorteWidget extends StatefulWidget {
  const RodaDaSorteWidget({Key? key}) : super(key: key);

  @override
  _RodaDaSorteWidgetState createState() => _RodaDaSorteWidgetState();
}

class _RodaDaSorteWidgetState extends State<RodaDaSorteWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  double _posicaoFinal = 0.0;
  double randomRotations =
      Random().nextDouble() * (4000.0 - 2500.0) + 2500.0;

  DadosDoJogo dadosJogo = DadosDoJogo();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: randomRotations,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    )..addListener(() {
      setState(() {
        _posicaoFinal = _rotationAnimation.value % 360.0;
      });
    });

    // Adicionando um statusListener para interromper a animação quando chegar ao final
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
  }

  void atualizadorAleatorio() {
    setState(() {
      randomRotations =
          Random().nextDouble() * (4000.0 - 2500.0) + 2500.0;
    });
  }

  // Função para iniciar a rotação rápida
  void _startRotation() {
    _controller.reset();
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: randomRotations,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    )..addListener(() {
      setState(() {
        _posicaoFinal = _rotationAnimation.value % 360.0;
      });
    });

    _controller.forward(from: 0.0);
  }

  Future<void> _stopRotation(BuildContext context) async {
    _controller.stop(); // Para a rotação atual

    await atualizaSaldo(_posicaoFinal);

    // Exibir a caixa de diálogo após a rotação e atualização do saldo
    caixaDeDialogo(context);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 320,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: AlwaysStoppedAnimation(
                _rotationAnimation.value / 360), // Garante rotação em um sentido
            child: Image.asset(
              'assets/IconesTelasJogos/rodaDaSorte.png',
              width: 230,
              height: 230,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              atualizadorAleatorio();
              _startRotation();
              Future.delayed(Duration(seconds: 10), () {
                _stopRotation(context);




              });
            },
            child: Text('Rodar'),
          ),
          SizedBox(height: 10),
          Text('Posição Final: $_posicaoFinal'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> caixaDeDialogo(BuildContext context) async {
   // double saldoNovo = await PreferenciasJogo.getSaldo();

    print('caixa de dialogo inicia');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Rotação Concluída"),
         // content: Text("A rotação foi finalizada com sucesso! >> $saldoNovo "),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar a caixa de diálogo
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    ).then((_) {
      // Forçar a atualização do widget que exibe o saldo
      setState(() {});
    });
  }

  Future<void> atualizaSaldo(double posicaoFinal) async {
    //double saldoAtual = await PreferenciasJogo.getSaldo();

    if (posicaoFinal >= 18) {
     // saldoAtual = saldoAtual * 1.10;
    }

    //await PreferenciasJogo.setSaldo(saldoAtual);
  }
}
