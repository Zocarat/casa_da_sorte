import 'dart:math';
import 'package:casa_da_sorte/Dados/DadosJogo/DadosDoJogo.dart';
import 'package:provider/provider.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/provider.dart';

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


    final authProvider = Provider.of<AuthProviderUser>(context, listen: false);
    double _saldoJogo = (authProvider.isAuthenticated
        ? authProvider.user?.saldo.toDouble() ?? 0.00
        : 0.00);
    // Exibir a caixa de diálogo após a rotação e atualização do saldo
     _saldoJogo = await atualizaSaldo(context ,_posicaoFinal, _saldoJogo);
    caixaDeDialogo(context,_posicaoFinal , _saldoJogo );

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

  Future<void> caixaDeDialogo(BuildContext context, double posicaoFinal, double saldo) async {


    String saldoString = saldo.toString();
    //atualizaSaldo(context, posicaoFinal);

    print('caixa de dialogo inicia');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Rotação Concluída Parabens"),
          content: Text("A rotação foi finalizada com sucesso! >> $saldoString "),
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

  Future<double> atualizaSaldo(BuildContext context, double posicaoFinal, double saldo) async {
    // Obtenha o provedor de autenticação do contexto

    if (posicaoFinal <= 30) {
      print('maior que 1');
      saldo = saldo * 3.10;
      final authProvider = Provider.of<AuthProviderUser>(context, listen: false);
      authProvider.updateSaldo(saldo);
      print('maior que 1');
    }
    if (posicaoFinal >= 100) {
      print('maior que 1');
      saldo = saldo * 1.10;
      final authProvider = Provider.of<AuthProviderUser>(context, listen: false);
      authProvider.updateSaldo(saldo);
      print('maior que 1');
    }
    if (posicaoFinal >= 250) {
      print('perdeu');
      saldo = saldo / 2.20;
      final authProvider = Provider.of<AuthProviderUser>(context, listen: false);
      authProvider.updateSaldo(saldo);

    }



    setState(() {
      saldo;
    });


    // Adicione lógica adicional conforme necessário

    return saldo;

    // Exemplo: Atualizar o saldo do jogo no servidor ou em qualquer lugar necessário
    //await DadosDoJogo.atualizarSaldoServidor(saldo);

  }

}

