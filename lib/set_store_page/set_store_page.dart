import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/bottom_bar/bottom_bar_page.dart';
import 'package:ramen_map_app/service/coloud_storage_service.dart';
import 'package:ramen_map_app/service/image_picker_service.dart';
import 'package:ramen_map_app/set_store_page/components/set_button.dart';
import 'package:ramen_map_app/set_store_page/set_store_controller.dart';

class SetStorePage extends ConsumerWidget {
  const SetStorePage(
      {Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeSetController = ref.watch(setStoreControllerProvider);
    final imagePickerService = ref.watch(imagePickerServiceProvider);
    final storageService = ref.watch(storageServiceProvider);
    final storeName = TextEditingController();
    final price = TextEditingController();
    final memo = TextEditingController();
    String area = "";

    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'お店登録',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: MaterialButton(
                      shape: const CircleBorder(
                          side: BorderSide(color: Colors.orange)),
                      onPressed: () {
                        imagePickerService.takeCamera();
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  imagePickerService.imagePath != null
                      ? Image.file(
                          imagePickerService.imagePath!,
                          width: 200.0,
                          height: 150.0,
                        )
                      : const Text("写真を追加"),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: MaterialButton(
                      shape: const CircleBorder(
                          side: BorderSide(color: Colors.orange)),
                      onPressed: () {
                        imagePickerService.takeGallery();
                      },
                      child: const Icon(
                        Icons.photo,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 350.0,
                child: TextFormField(
                  controller: storeName,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.ramen_dining_outlined,
                        color: Colors.orange,
                      ),
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
                      labelText: "店舗名"),
                ),
              ),
              SizedBox(
                width: 350.0,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: price,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.money_outlined,
                        color: Colors.orange,
                      ),
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
                      labelText: "価格"),
                ),
              ),
              SizedBox(
                width: 350.0,
                child: TextFormField(
                  controller: memo,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.note_outlined,
                        color: Colors.orange,
                      ),
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
                      labelText: "メモ"),
                ),
              ),
              SizedBox(
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
                      area = value!;
                    }),
              ),
              MaterialButton(
                onPressed: () async {
                  try {
                    storageService.uploadPostImageAndGetUrl(
                        file: imagePickerService.imagePath!);
                    storeSetController.setStore(
                        name: storeName.text,
                        price: price.text,
                        memo: memo.text,
                        area: area,
                        latitude: latitude,
                        longitude: longitude,
                        ramenImage: storageService.imageURL!);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomBarPage()),
                        (_) => false);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("登録エラー"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const SetButton(),
              ),
            ],
          ),
        ));
  }
}
