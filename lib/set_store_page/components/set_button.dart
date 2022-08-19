import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/bottom_bar/bottom_bar_page.dart';
import 'package:ramen_map_app/service/auth_service.dart';
import 'package:ramen_map_app/service/coloud_storage_service.dart';
import 'package:ramen_map_app/service/image_picker_service.dart';
import 'package:ramen_map_app/set_store_page/set_store_controller.dart';

class SetButton extends ConsumerWidget {
  const SetButton({
    Key? key,
    required this.storeName,
    required this.price,
    required this.memo,
    required this.area,
    required this.taste,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final String storeName;
  final String price;
  final String memo;
  final String area;
  final String taste;
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeSetController = ref.watch(setStoreControllerProvider);
    final storageService = ref.watch(storageServiceProvider);
    final imagePickerService = ref.watch(imagePickerServiceProvider);
    return MaterialButton(
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
              name: storeName,
              price: price,
              memo: memo,
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
      child: InkWell(
        child: Container(
          width: 160.0,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Colors.black12)
          ], color: Colors.white, borderRadius: BorderRadius.circular(22.0)),
          child: Row(children: <Widget>[
            Container(
              height: 50.0,
              width: 120.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 195, 14, 1),
                    Color.fromARGB(255, 248, 55, 41),
                    Color.fromARGB(255, 217, 81, 81)
                  ]),
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
              width: 30.0,
              child: Icon(
                Icons.add_outlined,
                color: Colors.redAccent,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
