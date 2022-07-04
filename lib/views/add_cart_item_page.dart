import 'package:flutter/material.dart';
import 'package:flutterfire_cart/controllers/add_cart_item_controller.dart';
import 'package:get/get.dart';

import '../models/item.dart';

class AddCartItemPage extends StatelessWidget {
  AddCartItemPage({Key? key, required this.title, required this.item})
      : super(key: key);
  final Item item;
  final AddCartItemController c = Get.put(AddCartItemController());
  String title;

  @override
  Widget build(BuildContext context) {
    c.nameC.text = item.pName;
    print(item.pName);
    c.quantityC.text = item.pQuantity;
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '$title Cart Item',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                textAlign: TextAlign.center,
                controller: c.nameC,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                  label: Text('Quantity'),
                ),
                textAlign: TextAlign.center,
                controller: c.quantityC,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  title.contains('Add') ? c.additems() : c.updateItem(item);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ]),
      ),
    );
  }
}
