import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/app_bar/base_app_bar.dart';
import 'package:ramen_map_app/bottom_bar/bottom_bar_page.dart';
import 'package:ramen_map_app/service/auth_service.dart';
import 'package:ramen_map_app/service/coloud_storage_service.dart';
import 'package:ramen_map_app/service/image_picker_service.dart';
import 'package:ramen_map_app/set_store_page/components/drop_down_menu.dart';
import 'package:ramen_map_app/set_store_page/components/set_button_design.dart';
import 'package:ramen_map_app/set_store_page/components/take_image_button.dart';
import 'package:ramen_map_app/set_store_page/components/text_input_form.dart';
import 'package:ramen_map_app/set_store_page/set_store_controller.dart';

class SetStorePage extends ConsumerWidget {
  const SetStorePage({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePickerService = ref.watch(imagePickerServiceProvider);
    final storeSetController = ref.watch(setStoreControllerProvider);
    final storageService = ref.watch(storageServiceProvider);
    final storeName = TextEditingController();
    final price = TextEditingController();
    final memo = TextEditingController();
    String area = "";
    String taste = "";

    return Scaffold(
      appBar: const BaseAppBar(
        title: Text(
          "登録",
          style: TextStyle(color: Colors.white),
        ),
        widgets: [],
        color: LinearGradient(
            colors: [Colors.red, Colors.deepOrange, Colors.orangeAccent]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TakeImageButton(
                    onTap: () {
                      imagePickerService.takeCamera();
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.orange,
                    )),
                imagePickerService.imagePath != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Image.file(
                          imagePickerService.imagePath!,
                          width: 200.0,
                          height: 150.0,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: 200.0,
                          height: 150.0,
                          color: Colors.amber[50],
                          child: const Center(
                            child: Text("写真を追加"),
                          ),
                        ),
                      ),
                TakeImageButton(
                  onTap: () {
                    imagePickerService.takeGallery();
                  },
                  icon: const Icon(
                    Icons.photo_outlined,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: TextInputForm(
                controller: storeName,
                icon: const Icon(
                  Icons.ramen_dining_outlined,
                  color: Colors.orange,
                ),
                labelText: "店舗名",
                keyboardType: TextInputType.name,
                maxLength: 100,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                child: TextInputForm(
                  controller: price,
                  icon: const Icon(
                    Icons.money_outlined,
                    color: Colors.orange,
                  ),
                  labelText: "価格",
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                )),
            Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: TextInputForm(
                  controller: memo,
                  keyboardType: TextInputType.name,
                  icon: const Icon(
                    Icons.note_outlined,
                    color: Colors.orange,
                  ),
                  labelText: "一言メモ",
                  maxLength: 30,
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 30.0,
                bottom: 60.0,
              ),
              child: Row(
                children: [
                  DropdownMenu(
                      items: areas,
                      icon: const Icon(
                        Icons.map_outlined,
                        color: Colors.orangeAccent,
                      ),
                      hintText: "エリア選択",
                      onChanged: (String? value) {
                        area = value!;
                      }),
                  const SizedBox(
                    width: 10.0,
                  ),
                  DropdownMenu(
                      items: tastes,
                      icon: const Icon(
                        Icons.map_outlined,
                        color: Colors.orangeAccent,
                      ),
                      hintText: "味選択",
                      onChanged: (String? value) {
                        taste = value!;
                      }),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () async {
                await Future.delayed(
                  const Duration(
                    seconds: 3,
                  ),
                );
                try {
                  storageService.uploadPostImageAndGetUrl(
                      file: imagePickerService.imagePath!);
                  storeSetController.setStore(
                      name: storeName.text,
                      price: price.text,
                      memo: memo.text,
                      area: area,
                      taste: taste,
                      latitude: latitude,
                      longitude: longitude,
                      ramenImage: storageService.imageURL!,
                      userId: ref.watch(authServiceProvider).userId);
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => BottomBarPage()),
                      (_) => false);
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "登録エラー\n再度試してください。",
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: const SetButtonDesign(),
            )
          ],
        ),
      ),
    );
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
