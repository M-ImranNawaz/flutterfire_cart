import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterfire_cart/controllers/home_controller.dart';
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
          showModalBottomSheet(
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
                    return Container(child: AddCartItemPage());
                  }));
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return Slidable(
              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                SlidableAction(onPressed: (_) {
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
}
