import 'dart:ui';
import 'package:casa_da_sorte/Dados/DadosJogo/authenticator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'UIHelperLogin.dart';
import 'screenRegistro.dart';
import 'package:casa_da_sorte/Home/ScreenHomePage.dart';
import 'package:casa_da_sorte/Helper/UIHelper.dart';

class screenLogin extends StatefulWidget {
  const screenLogin({super.key});

  @override
  State<screenLogin> createState() => _screenLoginState();
}

class _screenLoginState extends State<screenLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  void mostrarAlerta(String titulo, String mensagem, String txtBtn) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AvisoGeral(context, titulo, mensagem, txtBtn);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 22,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            //color: Colors.black,
            image: DecorationImage(
              image: AssetImage(
                  "assets/fundoCasaDaSorte.png"), // Substitua pelo caminho da sua imagem
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 500,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  //color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logoImage(150),
                    UIHelperLogin.textFieldCuston('Digite o E-mail',
                        const Icon(Icons.email), false, _emailController),
                    UIHelperLogin.textFieldCuston('Digite a senha',
                        const Icon(Icons.password), true, _passWordController),
                    const SizedBox(height: 25.0),
                    customButton(() async {
                      if (_emailController.text.isEmpty ||
                          _passWordController.text.isEmpty) {
                        mostrarAlerta(
                          'CAMPO VAZIO',
                          'Verifique o campo de E-mail e senha e tente novamente! ',
                          'OK',
                        );
                        return;
                      }

                      bool autenticado = await Autehenticator.authednticate(
                        context,
                        _emailController.text.toString(),
                        _passWordController.text.toString(),
                      );

                      if (autenticado) {
                        // Navega para tela principal
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScreenHomePage()),
                        );
                      }else {
                        // caso a autenticação falhar retorna mensagem erro
                        mostrarAlerta('Falha de Login', 'Falha de usario ou senha', 'Entendi');
                      }


                      // Navigator.push( context,  MaterialPageRoute(  builder: (context) => ScreenHomePage()), );
                    }, 'Entrar'),
                    const SizedBox(height: 5.0),
                    customButton(
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistroAuthenticator()));
                      },
                      'Cadastrar',
                    ),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScreenHomePage()));
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepPurple),
                      ),
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
