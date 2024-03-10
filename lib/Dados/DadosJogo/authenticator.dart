import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class Autehenticator {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // Funcao para autenticação do firebase

  static Future<bool> authednticate(String email, String password) async {
    try {
      UserCredential userCredencial = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // verifica se a autenticação foi bem sucedida
      if (userCredencial.user != null) {
        print('A autenticação foi bem sucedida');
        return true;
      } else {
        print(' A autenticação falhou ');
        return false; //  >>>>> a autenticação falhou
      }
    } catch (e) {
      print('Erro de autenticação $e');
      return false;
    }
  }

  static Future<bool> register (String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Verifica se o registro foi bem sucedido
      if (userCredential.user != null) {
        print('O registro foi bem sucedido!');
        return true;
      } else {
        print("  O registro Falho!");
        return false;
      }
    } catch (e) {
      print('Erro ao registar !   $e');
      return false;
    }

  }
}
