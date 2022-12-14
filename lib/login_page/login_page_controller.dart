import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/service/auth_service.dart';

final loginControllerProvider = ChangeNotifierProvider<LoginController>((ref) {
  return LoginController(ref.read);
});

class LoginController extends ChangeNotifier {
  final Reader _reader;
  LoginController(this._reader);
  String errorMessage = '';

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _reader(authServiceProvider)
          .loginUser(email: email, password: password);
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void setErrorText(String errorText) {
    errorMessage = errorText;
    notifyListeners();
  }
}
