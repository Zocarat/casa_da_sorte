import 'package:flutter/material.dart';
import 'UIHelperLogin.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/authenticator.dart';

class RegistroAuthenticator extends StatefulWidget {
  const RegistroAuthenticator({super.key});

  @override
  State<RegistroAuthenticator> createState() => _RegistroAuthenticatorState();
}

class _RegistroAuthenticatorState extends State<RegistroAuthenticator> {
  @override
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _noError = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Registrar conta '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIHelperLogin.textFieldCuston(
                'NOME', Icon(Icons.abc), false, _noError),
            UIHelperLogin.textFieldCuston(
                'SOBRENOME', Icon(Icons.abc), false, _noError),
            UIHelperLogin.textFieldCuston(
                'E-MAIL', Icon(Icons.abc), false, _emailController),
            UIHelperLogin.textFieldCuston(
                'SENHA', Icon(Icons.abc), true, _passwordController),
            ElevatedButton(
                onPressed: () {
                  Autehenticator.register(_emailController.toString(),
                      _passwordController.toString());
                },
                style: ElevatedButton.styleFrom(
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text('CADASTRAR'))
          ],
        ),
      ),
    );
  }
}
