import 'package:flutter/material.dart';
import 'package:casa_da_sorte/Configuracoes/home_config.dart';

class MeuBotaoComImagem extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  MeuBotaoComImagem({
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 200.0, // Ajuste a largura conforme necessário
        height: 200.0, // Ajuste a altura conforme necessário
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

Widget CustomButtonJogos(VoidCallback callback) {
  return Container(
    width: 150,
    height: 150,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      color: Colors.transparent,
    ),
    child: IconButton(
      icon: Image.asset(
        "assets/IconesMenuCentral/rodaDaSorte.png",
        fit: BoxFit.cover,
      ),
      //iconSize: 60,

      onPressed: callback,
    ),
  );
}

Widget CustonButtonApp(BuildContext context) {
  return BottomAppBar(
    child: Container(
      width: 300,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home_filled)),
          IconButton(onPressed: () {}, icon: Icon(Icons.monetization_on)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenConfig()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
    ),
  );
}

Widget listaHorizontal(List<Widget> children) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Container(
      //alignment: Alignment.center,
      height: 120.0,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        },
      ),
    )
  ]);
}

// ==============================================================================
// ======================= Messagem de aviso uso Geral ==========================
// ==============================================================================

// Como diz o proprio nome, é uma caixa pra dar avisso de erro ou alerta ao usuário
Widget AvisoGeral(
  BuildContext context,
  String titulo,
  String mensagem,
  String txtButton,
) {
  return AlertDialog(
    title: Text(titulo),
    content: Text(mensagem),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop(); //Fecha caixa de dialogo
          },
          child: Text(txtButton))
    ],
  );
}

// ==============================================================================
