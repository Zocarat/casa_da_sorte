import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class FirebaseConfig {
  static  StartFirebase() async {

    WidgetsFlutterBinding.ensureInitialized();

    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyCYxBMdvfEGe6Gpnt0j6HbP-4fUmdsn1Ps",
          appId: "1:262548548047:android:0afeb693a53ccbab9a0aba",
          messagingSenderId: "262548548047",
          projectId: "casa-da-sorte-1c639",
        ),
      );
    }catch (e){
      print('Erro ao acessar serviço >>>>   $e');
    }

    print('A função StartFirebase foi concluida');
  }
}
