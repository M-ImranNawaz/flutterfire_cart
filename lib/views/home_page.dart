import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterfire_cart/controllers/home_controller.dart';
import 'package:flutterfire_cart/models/item.dart';
import 'package:get/get.dart';
import 'add_cart_item_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildAEPage(context,Item(id: '', pName: '', pQuantity: ''));
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return Slidable(
              startActionPane:
                  ActionPane(motion: const ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (_) {
                    buildAEPage(context,
                    c.cartItems.elementAt(index),
                        title: "Update",);
                  },
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 0, 150, 67),
                  icon: Icons.delete,
                  label: 'Edit',
                  spacing: 4,
                ),
              ]),
              endActionPane:
                  ActionPane(motion: const ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (_) {
                    c.deleteItem(c.cartItems.elementAt(index).id);
                  },
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  label: 'Delete',
                  spacing: 4,
                ),
              ]),
              child: ListTile(
                title: Text(c.cartItems.elementAt(index).pName),
                subtitle: Text(c.cartItems.elementAt(index).pQuantity),
              ),
            );
          },
          itemCount: c.cartItems.length,
        ),
      ),
    );
  }

  Future<dynamic> buildAEPage(
    BuildContext context,
    Item item,
    {
    String title = "Add",
  }) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.75, //set this as you want
            maxChildSize: 0.75, //set this as you want
            minChildSize: 0.75, //set this as you want
            expand: true,
            builder: (context, scrollController) {
              return AddCartItemPage(
                title: title,
                item: item,
              );
            }));
  }
}
