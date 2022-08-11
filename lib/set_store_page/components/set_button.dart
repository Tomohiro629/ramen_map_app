import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/set_store_page/set_store_controller.dart';

class SetButton extends ConsumerWidget {
  const SetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeSetController = ref.watch(setStoreControllerProvider);
    return MaterialButton(
        onPressed: () {
          try {
            storeSetController.setStore(
                name: "name",
                price: "price",
                memo: " memo",
                area: '',
                latitude: 3.1111,
                longitude: 4.1234);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("登録エラー"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: InkWell(
          child: Container(
            width: 200.0,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  offset: Offset(0.0, 20.0),
                  blurRadius: 30.0,
                  color: Colors.black12)
            ], color: Colors.white, borderRadius: BorderRadius.circular(22.0)),
            child: Row(children: <Widget>[
              Container(
                height: 50.0,
                width: 150.0,
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 40.0),
                decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(95.0),
                        topLeft: Radius.circular(95.0),
                        bottomRight: Radius.circular(200.0))),
                child: Text(
                  '登録',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              const SizedBox(
                width: 40.0,
                child: Icon(
                  Icons.add_outlined,
                  color: Colors.redAccent,
                ),
              )
            ]),
          ),
        ));
  }
}
