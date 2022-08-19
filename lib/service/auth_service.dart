import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  final _auth = FirebaseAuth.instance;
  String get userId => _auth.currentUser!.uid; //カレントユーザーのIDをuserIdへ
  Stream<User?> get getAuthState => _auth.authStateChanges();

  Future<void> signupUser(
      {required String newEmail, required String newPassword}) async {
    await _auth.createUserWithEmailAndPassword(
        email: newEmail, password: newPassword);
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("ログイン失敗");
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    if (_auth.currentUser == null) {
      print('ログアウト成功');
    }
  }
}
