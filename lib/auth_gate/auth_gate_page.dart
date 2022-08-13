import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/home_page/home_page.dart';
import 'package:ramen_map_app/service/auth_service.dart';
import 'package:ramen_map_app/store_list_page/store_list_page.dart';

class AuthGatePage extends ConsumerWidget {
  const AuthGatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authServiceProvider).getAuthState;
    return StreamBuilder<User?>(
      stream: authUser,
      builder: ((context, snapshot) {
        final isLogin = snapshot.data != null;
        return isLogin ? const StoreListPage() : const HomePage();
        //login,signup成功：失敗
      }),
    );
  }
}
