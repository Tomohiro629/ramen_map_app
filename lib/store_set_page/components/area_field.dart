import 'package:flutter/material.dart';

class AreaField extends StatelessWidget {
  AreaField({Key? key}) : super(key: key);
  final memo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: DropdownButtonFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.deepOrange,
                width: 2,
              )),
              hintText: "エリア選択",
              prefixIcon: Icon(
                Icons.map_outlined,
                color: Colors.orangeAccent,
              )),
          items: const [
            DropdownMenuItem(value: "北区", child: Text("北区")),
            DropdownMenuItem(value: "左京区", child: Text("左京区")),
            DropdownMenuItem(value: "右京区", child: Text("右京区")),
            DropdownMenuItem(value: "上京区", child: Text("上京区")),
            DropdownMenuItem(value: "中京区", child: Text("中京区")),
            DropdownMenuItem(value: "下京区", child: Text("下京区")),
            DropdownMenuItem(value: "南区", child: Text("南区")),
            DropdownMenuItem(value: "西京区", child: Text("西京区")),
            DropdownMenuItem(value: "東山区", child: Text("東山区")),
            DropdownMenuItem(value: "山科区", child: Text("山科区")),
            DropdownMenuItem(value: "伏見区", child: Text("伏見区")),
            DropdownMenuItem(value: "京都市外", child: Text("京都市外")),
          ],
          onChanged: (String? value) {
            value;
          }),
    );
  }
}
