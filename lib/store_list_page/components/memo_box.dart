import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
import 'package:ramen_map_app/store_list_page/components/delete_store_dialog.dart';
import 'package:ramen_map_app/store_list_page/components/edit_store_page.dart';

class MemoBox extends ConsumerWidget {
  const MemoBox({Key? key, required this.store}) : super(key: key);
  final Store store;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeRepository = ref.watch(storeRepositoryProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.amber[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              store.favorite == null
                  ? storeRepository.addFavoriteStore(store.storeId)
                  : storeRepository.deleteFavoriteStore(store.storeId);
              ScaffoldMessenger.of(context).showSnackBar(store.favorite == null
                  ? SnackBar(
                      content: Text(
                        "${store.name}を\nお気に入りに登録しました！",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: const Color.fromARGB(219, 209, 67, 186),
                      duration: const Duration(seconds: 1),
                    )
                  : SnackBar(
                      content: Text(
                        "${store.name}を\nお気に入りから削除しました。",
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: const Color.fromARGB(219, 67, 209, 140),
                      duration: const Duration(seconds: 1),
                    ));
            },
            icon: store.favorite == null
                ? const Icon(
                    Icons.favorite_outline,
                    size: 20.0,
                  )
                : const Icon(
                    Icons.favorite_outline_outlined,
                    color: Color.fromARGB(179, 246, 14, 173),
                    size: 20.0,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "一言メモ:${store.memo}",
              maxLines: 2,
              style: const TextStyle(fontSize: 15.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  color: Colors.blueAccent,
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditStorePage(store: store)));
                  }),
              IconButton(
                  color: Colors.redAccent,
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (childContext) {
                          return DeleteCheckDialog(store: store);
                        });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
