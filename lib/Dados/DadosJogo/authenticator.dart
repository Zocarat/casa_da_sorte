import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:casa_da_sorte/Dados/DadosJogo/provider.dart';
import 'package:universal_html/js.dart';

class Autehenticator {
  static FirebaseAuth _auth = FirebaseAuth.instance;



  // Funcao para autenticação do firebase

  static Future<bool> authednticate(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // verifica se a autenticação foi bem sucedida
      if (userCredential.user != null) {
        // configura o usuário autenticado no AuthProvider
        UserProvider user = UserProvider(
          name: userCredential.user!.displayName ?? 'Usuário',
          email: '',
          saldo: 0.00,
        );

        Provider.of<AuthProviderUser>(context, listen: false).setUser(user);
        // Chama a função para buscar os dados do Firestore
        await _fetchUserDataFromFirestore(context, email); // Corrigido aqui



        print('A autenticação foi bem sucedida');
        return true;
      } else {
        print('A autenticação falhou');
        return false;
      }
    } catch (e) {
      print('Erro de autenticação $e');
      return false;
    }
  }

  static Future<bool> register(String email, String password) async {
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
//======================================== colacar na funcao de banco de dados
  // Função para obter dados do Firestore usando o e-mail
  static Future<void> _fetchUserDataFromFirestore(BuildContext context, String email) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();
        if (userData is Map<String, dynamic>) {
          double saldo = userData['saldo'] ?? 0.00;
          String nome = userData['nome'] ?? 'Usuário';

          // Atualiza o provedor de autenticação com os dados do Firestore
          UserProvider user = UserProvider(name: nome, email: email, saldo: saldo);
          Provider.of<AuthProviderUser>(context, listen: false).setUser(user);
        } else {
          print('Dados do usuário não são um mapa.');
        }
      } else {
        print('Usuário não encontrado no Firestore');
      }
    } catch (e) {
      print('Erro ao obter dados do Firestore $e');
    }
  }









}

//===============  ATENÇÃO RETIRAR DAQUI E MUDAR PRA CLASSE DE BANCO DE DADOS


