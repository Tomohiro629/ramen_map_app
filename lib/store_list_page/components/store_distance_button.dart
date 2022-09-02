import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreDistaceButton extends ConsumerWidget {
  const StoreDistaceButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
                colors: [Colors.red, Colors.deepOrange, Colors.orangeAccent]),
          ),
          width: 200.0,
          child: MaterialButton(
              onPressed: () {
                // showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return StoreLimitDiarog(
                //           store: store, storeDistance: storeDistance);
                //     });
              },
              child: const Text(
                "近いお店を探す",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
