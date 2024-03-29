import 'package:flutter/material.dart';
import 'UIHelperLogin.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/authenticator.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/firebase_service.dart';

class RegistroAuthenticator extends StatefulWidget {
  const RegistroAuthenticator({super.key});

  @override
  State<RegistroAuthenticator> createState() => _RegistroAuthenticatorState();
}

class _RegistroAuthenticatorState extends State<RegistroAuthenticator> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _sobrenomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Registrar conta ',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/fundoTelaCadastro.png"),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoImage(150),
              UIHelperLogin.textFieldCuston('NOME',
                  const Icon(Icons.contact_mail_rounded), false, _nomeController),
              UIHelperLogin.textFieldCuston(
                  'SOBRENOME', const Icon(Icons.abc), false, _sobrenomeController),
              UIHelperLogin.textFieldCuston(
                  'E-MAIL', const Icon(Icons.email), false, _emailController),
              UIHelperLogin.textFieldCuston(
                  'SENHA', const Icon(Icons.password), true, _passwordController),
              ElevatedButton(
                  onPressed: () {
                    Autehenticator.register(
                      _emailController.text.toString(),
                      _passwordController.text.toString(),
                    );
                    FirebaseService.registerUser(
                      _nomeController.text.toString(),
                      _sobrenomeController.text.toString(),
                      _emailController.text.toString(),
                      0.48,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fixedSize: const Size(200, 50),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('CADASTRAR'))
            ],
          ),
        ),
      ),
    );
  }
}
