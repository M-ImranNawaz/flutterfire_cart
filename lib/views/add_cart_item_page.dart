import 'package:flutter/material.dart';
import 'package:flutterfire_cart/controllers/add_cart_item_controller.dart';

class AddCartItemPage extends StatelessWidget {
  AddCartItemPage({Key? key}) : super(key: key);

  final AddCartItemController c = AddCartItemController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child:
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            'Add Cart Item',
            textAlign: TextAlign.center,
            style: TextStyle(
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
              c.additems();
              Navigator.pop(context);
            },
            style:
                TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
