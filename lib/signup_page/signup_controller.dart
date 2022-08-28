import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/service/auth_service.dart';

final signupControllerProvider =
    ChangeNotifierProvider<SignUpController>((ref) {
  return SignUpController(ref.read);
});

class SignUpController extends ChangeNotifier {
  final Reader _reader;
  String error = "";
  SignUpController(this._reader);

  void setErrorText(String errorText) {
    error = errorText;
    notifyListeners();
  }

  Future<void> signUpUser({
    required String newEmail,
    required String newPassword,
  }) async {
    await _reader(authServiceProvider).signupUser(
      newEmail: newEmail,
      newPassword: newPassword,
    );
    await _reader(authServiceProvider)
        .loginUser(email: newEmail, password: newPassword);
  }
}
