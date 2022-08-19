import 'package:flutter/material.dart';
import 'package:ramen_map_app/store_list_page/store_list_page.dart';

class TasteList extends StatelessWidget {
  const TasteList({Key? key, required this.taste, required this.imageURL})
      : super(key: key);
  final String taste;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 14.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Stack(children: <Widget>[
        Ink(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageURL), fit: BoxFit.cover)),
          child: InkWell(
            splashColor: const Color.fromARGB(119, 255, 184, 77),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => StoreListPage(
                            taste: taste,
                          ))));
            },
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromARGB(173, 48, 46, 46),
              ),
              child: Text(
                taste,
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            )),
      ]),
    );
  }
}

List<TasteList> tastes = [
  const TasteList(
    taste: "醤油",
    imageURL: "images/syoyu.jpg",
  ),
  const TasteList(
    taste: "豚骨",
    imageURL: "images/tonkotu.jpg",
  ),
  const TasteList(
    taste: "豚骨醤油",
    imageURL: "images/tonkotusyoyu.jpg",
  ),
  const TasteList(
    taste: "味噌",
    imageURL: "images/miso.jpg",
  ),
  const TasteList(
    taste: "塩",
    imageURL: "images/sio.jpg",
  ),
  const TasteList(
    taste: "その他",
    imageURL: "images/sonota.jpg",
  )
];
