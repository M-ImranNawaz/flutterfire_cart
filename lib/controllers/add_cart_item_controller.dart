import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_cart/constants.dart';
import 'package:flutterfire_cart/models/item.dart';
import 'package:get/get.dart';

class AddCartItemController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController quantityC = TextEditingController();

  additems() {
    var item = Item(
        id: 'id', pName: nameC.text.trim(), pQuantity: quantityC.text.trim());
    FirebaseFirestore.instance.collection(kCollectionName).add(item.toMap());
  }

  void updateItem(Item id) {
    var item = Item(
        id: id.id, pName: nameC.text.trim(), pQuantity: quantityC.text.trim());
    FirebaseFirestore.instance.collection(kCollectionName).doc(id.id).set(item.toMap());
  }
}
