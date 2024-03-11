import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  static Future<bool> registerUser(
    String nome,
    String sobrenome,
    String email,
    double saldo,
  ) async {
    try {
      print('Tentando se conectar ao banco de dados');
      // Conectar ao banco de dados
      FirebaseFirestore firestone = FirebaseFirestore.instance;

      // Adicna usuário ao banco de dados:
      await firestone.collection('users').add({
        'nome': nome,
        'sobrenome': sobrenome,
        'email': email,
        'saldo': 10.00,
      });
      print('Registro bem sucedido ao Firebase, usuário foi cadastrado!');
      return true;
    } catch (e) {
      print('Erro durante o registro: >>> $e');
      return false;
    }
  }
}
