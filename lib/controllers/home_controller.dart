import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_cart/constants.dart';
import 'package:get/get.dart';

import '../models/item.dart';

class HomeController extends GetxController {
  String? name, quantity;
  List<Item> cartItems = <Item>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    FirebaseFirestore.instance.collection(kCollectionName).snapshots().listen(
      (data) {
        mapData(data);
      },
    );
    //mapData(data);
  }

  mapData(QuerySnapshot<Map<String, dynamic>> data) {
    var list = data.docs
        .map((item) => Item(
            id: item.id, pName: item['pName'], pQuantity: item['pQuantity']))
        .toList();
    cartItems.clear();
    cartItems.addAll(list);
  }

  void deleteItem(String id) {
    FirebaseFirestore.instance.collection(kCollectionName).doc(id).delete();
  }
}
