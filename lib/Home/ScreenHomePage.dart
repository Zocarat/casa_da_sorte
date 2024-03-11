import 'package:casa_da_sorte/Jogos/RodaDaSorte/ScreenRodaDaSorte.dart';
import 'package:casa_da_sorte/Login/screenLogin.dart';
import 'package:casa_da_sorte/Modulos/PainelSuperior.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:casa_da_sorte/Helper/UIHelper.dart';
import 'package:casa_da_sorte/Modulos/PainelSuperior.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/DadosDoJogo.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/provider.dart';
import 'package:provider/provider.dart';

class ScreenHomePage extends StatefulWidget {
  const ScreenHomePage({super.key});

  @override
  State<ScreenHomePage> createState() => _ScreenHomePageState();
}


class _ScreenHomePageState extends State<ScreenHomePage> {

  late AuthProviderUser authProvider;



  @override
  Widget build(BuildContext context) {

    authProvider = Provider.of<AuthProviderUser>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => screenLogin()));
            AuthProviderUser().signOut();

           }, icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fundoTelaHome.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Bem vindo, ${authProvider.user?.name ?? 'Usuário'}'),
              //Text('Saldo, ${authProvider.user?.saldo ?? '####'}'),
              SizedBox(height: 15.0),
              PainelSuperior('${authProvider.user?.saldo ?? '####'}'),
              SizedBox(height: 15.0),
              listaHorizontal([
                CustomButtonJogos(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenRodaDaSorte()),
                  );
                }),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustonButtonApp(),
    );
  }
}
