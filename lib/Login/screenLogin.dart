import 'dart:ui';
import 'package:casa_da_sorte/Dados/DadosJogo/authenticator.dart';
import 'package:flutter/material.dart';
import 'UIHelperLogin.dart';
import 'screenRegistro.dart';
import 'package:casa_da_sorte/Home/ScreenHomePage.dart';

class screenLogin extends StatefulWidget {
  const screenLogin({super.key});

  @override
  State<screenLogin> createState() => _screenLoginState();
}

class _screenLoginState extends State<screenLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                height: 400,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  //color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UIHelperLogin.textFieldCuston('Digite o E-mail',
                        Icon(Icons.email), false, _emailController),
                    UIHelperLogin.textFieldCuston('Digite a senha',
                        Icon(Icons.password), true, _passWordController),
                    SizedBox(height: 25.0),
                    customButton(() {
                      Autehenticator.authednticate(
                        _emailController.toString(),
                        _passWordController.toString(),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenHomePage()),
                      );
                    }, 'Entrar'),
                    SizedBox(height: 5.0),
                    customButton(
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistroAuthenticator()));
                      },
                      'Cadastrar',
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenHomePage()));
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
