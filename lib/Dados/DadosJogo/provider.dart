import 'package:flutter/foundation.dart';

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
}
