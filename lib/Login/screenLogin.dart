import 'package:flutter/material.dart';
import 'UIHelperLogin.dart';
import 'package:casa_da_sorte/Home/ScreenHomePage.dart';

class screenLogin extends StatefulWidget {
  const screenLogin({super.key});

  @override
  State<screenLogin> createState() => _screenLoginState();
}

class _screenLoginState extends State<screenLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        elevation: 22,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
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
                UIHelperLogin.textFieldCuston(
                    'Digite o E-mail' ,  Icon(Icons.email), false),
                UIHelperLogin.textFieldCuston(
                    'Digite a senha' ,Icon(Icons.password), true ),
                SizedBox(height: 25.0),
                customButton(() {

                  Navigator.push( context, MaterialPageRoute(builder: (context) => ScreenHomePage()));


                }, 'Entrar'),
                SizedBox(height: 5.0),
                customButton(() {}, 'Cadastrar'),
                SizedBox(height: 16.0),
                TextButton(onPressed: (){},
                    child: Text('Esqueceu a senha?'))


              ],
            ),
          )
        ],
      )),
    );
  }
}
