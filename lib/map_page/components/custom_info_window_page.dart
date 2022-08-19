import 'package:flutter/material.dart';
import 'package:ramen_map_app/entity/store.dart';

class CustomInfoWindowPage extends StatelessWidget {
  const CustomInfoWindowPage({Key? key, required this.store}) : super(key: key);
  final Store store;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(store.ramenImage),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(store.name)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
