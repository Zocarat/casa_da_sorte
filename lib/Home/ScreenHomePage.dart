import '../Jogos/RodaDaSorte/ScreenRodaDaSorte.dart' show ScreenRodaDaSorte;
import 'package:casa_da_sorte/Login/screenLogin.dart';
import 'package:casa_da_sorte/Modulos/PainelSuperior.dart';
import 'package:flutter/material.dart';
import 'package:casa_da_sorte/Helper/UIHelper.dart';
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
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const screenLogin()));
                AuthProviderUser().signOut();
              },
              icon: const Icon(Icons.exit_to_app)),
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
              const SizedBox(height: 15.0),
              PainelSuperior(context),
              SizedBox(height: 15.0),
              listaHorizontal([
                CustomButtonJogos(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenRodaDaSorte()),
                  );
                }),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustonButtonApp(context),
    );
  }
}
