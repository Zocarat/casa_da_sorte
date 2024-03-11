import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  final String name;
  final String email;
  double saldo;

  UserProvider({
    required this.name,
    required this.email,
    required this.saldo,
  });
}

class AuthProviderUser with ChangeNotifier {
  UserProvider? _user;

  UserProvider? get user => _user;

  bool get isAuthenticated => _user != null;

  void setUser(UserProvider user) {
    _user = user;
    notifyListeners();
  }

  void signOut() {
    _user = null;
    print('Usuário deslogado');
    notifyListeners();
  }

// Função para atualizar o saldo do usuário localmente
  void updateSaldo(double newSaldo) {
    if (_user != null) {
      _user!.saldo = newSaldo;
      // Atualizar o saldo no Firestore
      updateSaldoFirestore(newSaldo);
      // Notificar os ouvintes sobre a mudança
      notifyListeners();
    }
  }

  // Função para atualizar o saldo no Firestore
  // Função para atualizar o saldo do usuário no Firestore
  Future<void> updateSaldoFirestore(double newSaldo) async {
    if (_user != null) {
      String userEmail = _user!.email;
      String? email = await getUserIdByEmail(userEmail);

      try {
        // Referência ao documento do usuário no Firestore
        DocumentReference userDocRef =
            FirebaseFirestore.instance.collection('users').doc(email);

        // Atualizar o saldo no Firestore
        await userDocRef.update({'saldo': newSaldo});

        // Atualizar o saldo localmente no objeto _user
        _user!.saldo = newSaldo;

        // Notificar os ouvintes sobre a mudança
        notifyListeners();
      } catch (error) {
        print('Erro ao atualizar o saldo no Firestore: $error');
        // Lidar com o erro conforme necessário
      }
    }
  }

  Future<String?> getUserIdByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Se há algum documento com o email especificado
        return querySnapshot.docs.first.id;
      } else {
        // Caso contrário, o documento não foi encontrado
        return null;
      }
    } catch (e) {
      print('Erro ao obter o ID do usuário por email: $e');
      return null;
    }
  }
}
