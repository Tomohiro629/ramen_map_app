import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/service/auth_service.dart';

final signupControllerProvider =
    ChangeNotifierProvider<SignUpController>((ref) {
  return SignUpController(ref.read);
});

class SignUpController extends ChangeNotifier {
  final Reader _reader;
  SignUpController(this._reader);

  Future<void> signUpUser({
    required String newEmail,
    required String newPassword,
  }) async {
    try {
      await _reader(authServiceProvider).signupUser(
        newEmail: newEmail,
        newPassword: newPassword,
      );
    } catch (e) {
      print(e);
    }
  }
}
