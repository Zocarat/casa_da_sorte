import 'package:casa_da_sorte/Jogos/RodaDaSorte/ScreenRodaDaSorte.dart';
import 'package:casa_da_sorte/Modulos/PainelSuperior.dart';
import 'package:flutter/material.dart';
import 'package:casa_da_sorte/Helper/UIHelper.dart';
import 'package:casa_da_sorte/Modulos/PainelSuperior.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/DadosDoJogo.dart';


class ScreenHomePage extends StatefulWidget  {
  const ScreenHomePage({super.key});

  @override
  State<ScreenHomePage> createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage>  {









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15.0),
            PainelSuperior(''),
            SizedBox(height: 15.0),
            listaHorizontal([
              CustomButtonJogos(
                  (){
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => ScreenRodaDaSorte()));
                  }
              ),



            ]),
          ],
        ),
      ),
      bottomNavigationBar: CustonButtonApp(),
    );

  }

}
