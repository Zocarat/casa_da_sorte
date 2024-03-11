import 'package:casa_da_sorte/Dados/DadosJogo/provider.dart';
import 'package:casa_da_sorte/Home/ScreenHomePage.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/inicializador_firebase.dart';
import 'package:flutter/material.dart';
import 'Login/screenLogin.dart';
import 'package:provider/provider.dart';

void main() async {
  try {
    //await Firebase.initializeApp();
    await FirebaseConfig.StartFirebase();
    runApp(
      ChangeNotifierProvider(
        create: (context) => AuthProviderUser(),
        child: MyApp(),
      ),
    );
  } catch (e) {
    print('Erro durante a inicialização do Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  // Remova a palavra-chave const aqui
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Consumer<AuthProviderUser>(
        builder: (context, authProvider, child) {
          if (authProvider.isAuthenticated) {
            return ScreenHomePage(); // Remova a palavra-chave const aqui
          } else {
            return screenLogin(); // Remova a palavra-chave const aqui
          }
        },
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviderUser>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (authProvider.isAuthenticated)
              Text('Welcome, ${authProvider.user?.name ?? 'User'}'),
            const SizedBox(height: 20),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


