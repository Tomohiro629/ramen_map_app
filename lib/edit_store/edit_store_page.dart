import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/bottom_bar/bottom_bar_page.dart';
import 'package:ramen_map_app/edit_store/components/edit_drop_down_menu.dart';
import 'package:ramen_map_app/edit_store/components/edit_input_form.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
// import 'package:ramen_map_app/service/coloud_storage_service.dart';
// import 'package:ramen_map_app/service/image_picker_service.dart';
import 'package:ramen_map_app/edit_store/components/edit_button_desing.dart';

class EditStorePage extends ConsumerWidget {
  const EditStorePage({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeEditController = ref.watch(storeRepositoryProvider);
    // final imagePickerService = ref.watch(imagePickerServiceProvider);
    // final storageService = ref.watch(storageServiceProvider);
    final storeName = TextEditingController();
    final price = TextEditingController();
    final memo = TextEditingController();
    String area = "";
    String taste = "";

    storeName.text = store.name;
    price.text = store.price;
    memo.text = store.memo;

    return Scaffold(
        appBar: const BaseAppBar(
          title: Text(
            "変更",
            style: TextStyle(color: Colors.white),
          ),
          widgets: [],
          color: LinearGradient(colors: [
            Color.fromARGB(255, 47, 33, 243),
            Color.fromARGB(207, 35, 69, 239),
            Colors.lightBlue
          ]),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(top: 80.0),
                //       child: MaterialButton(
                //         shape: const CircleBorder(
                //             side: BorderSide(color: Colors.blue)),
                //         onPressed: () {
                //           imagePickerService.takeCamera();
                //         },
                //         child: const Icon(
                //           Icons.camera_alt,
                //           color: Colors.blue,
                //         ),
                //       ),
                //     ),
                //     imagePickerService.imagePath != null
                //         ? Image.file(
                //             imagePickerService.imagePath!,
                //             width: 220.0,
                //             height: 120.0,
                //           )
                //         : Stack(alignment: Alignment.center, children: [
                //             const CircularProgressIndicator(
                //               color: Colors.blue,
                //             ),
                //             SizedBox(
                //                 width: 220.0,
                //                 height: 120.0,
                //                 child: Image.network(store.ramenImage)),
                //           ]),
                //     Padding(
                //       padding: const EdgeInsets.only(top: 80.0),
                //       child: MaterialButton(
                //         shape: const CircleBorder(
                //             side: BorderSide(color: Colors.blue)),
                //         onPressed: () {
                //           imagePickerService.takeGallery();
                //         },
                //         child: const Icon(
                //           Icons.photo,
                //           color: Colors.blue,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 60.0),
                    child: EditInputForm(
                      controller: storeName,
                      icon: const Icon(
                        Icons.ramen_dining_outlined,
                        color: Colors.lightBlue,
                      ),
                      labelText: "店舗名",
                      keyboardType: TextInputType.name,
                      maxLength: 100,
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: EditInputForm(
                    controller: price,
                    icon: const Icon(
                      Icons.money_outlined,
                      color: Colors.lightBlue,
                    ),
                    labelText: "価格",
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                  ),
                ),
                EditInputForm(
                    controller: memo,
                    labelText: "メモ",
                    keyboardType: TextInputType.name,
                    icon: const Icon(
                      Icons.note_outlined,
                      color: Colors.lightBlue,
                    ),
                    maxLength: 30),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    left: 30.0,
                    bottom: 60.0,
                  ),
                  child: Row(
                    children: [
                      EditDropdownMenu(
                          items: areas,
                          icon: const Icon(
                            Icons.map_outlined,
                            color: Colors.lightBlue,
                          ),
                          hintText: "エリア選択",
                          onChanged: (String? value) {
                            area = value!;
                          },
                          value: store.area),
                      const SizedBox(
                        width: 10.0,
                      ),
                      EditDropdownMenu(
                          items: tastes,
                          icon: const Icon(
                            Icons.dining_outlined,
                            color: Colors.lightBlue,
                          ),
                          hintText: "味選択",
                          onChanged: (String? value) {
                            taste = value!;
                          },
                          value: store.taste)
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    try {
                      storeEditController.updateStore(
                        storeId: store.storeId,
                        editStoreName: storeName.text,
                        editPrice: price.text,
                        editMemo: memo.text,
                        editArea: area.isEmpty ? store.area : area,
                        editTaste: taste.isEmpty ? store.taste : taste,
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomBarPage()),
                          (_) => false);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "変更エラー\n再度試してください。",
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  child: const EditButtonDesign(),
                ),
              ],
            ),
          ),
        ));
  }
}

List<DropdownMenuItem<String>> tastes = const [
  DropdownMenuItem(value: "醤油", child: Text("醤油")),
  DropdownMenuItem(value: "豚骨", child: Text("豚骨")),
  DropdownMenuItem(value: "豚骨醤油", child: Text("豚骨醤油")),
  DropdownMenuItem(value: "味噌", child: Text("味噌")),
  DropdownMenuItem(value: "塩", child: Text("塩")),
  DropdownMenuItem(value: "その他", child: Text("その他")),
];

List<DropdownMenuItem<String>> areas = const [
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
];
