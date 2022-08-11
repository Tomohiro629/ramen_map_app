import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreSetPage extends ConsumerWidget {
  const StoreSetPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'お店登録',
              style: TextStyle(),
            ),
            backgroundColor: Colors.white,
            centerTitle: true),
        body: Column(
          children: [],
        ));
  }
}
