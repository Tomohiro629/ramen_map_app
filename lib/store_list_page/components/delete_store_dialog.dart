import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/store_list_page/store_list_controller.dart';

class DeleteCheckDialog extends ConsumerWidget {
  const DeleteCheckDialog({
    Key? key,
    required this.store,
  }) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeListController = ref.watch(storeListProvider);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text("『${store.name}』を削除しますか？"),
      actions: <Widget>[
        MaterialButton(
          color: Colors.redAccent,
          child: const Text("はい"),
          onPressed: () async {
            storeListController.deleteStore(store.storeId);
            Navigator.of(context).pop();
          },
        ),
        MaterialButton(
          color: Colors.blueAccent,
          child: const Text("いいえ"),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
