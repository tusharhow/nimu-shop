import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimu_shop/controllers/cart_controller.dart';
import 'package:nimu_shop/controllers/shop_controller.dart';

final cartController = Get.put(CartController());
final shoppingController = Get.put(ShoppingController());

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  get cartItems => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Cart'),
      ),
      body: GetX<CartController>(builder: (controller) {
        return ListView.builder(
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: GetX<CartController>(builder: (controller) {
                  return Text(
                    '${controller.cartItems[index].productName}',
                    style: TextStyle(fontSize: 18),
                  );
                }),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    cartController.removeFromCart(controller.cartItems[index]);
                  },
                ),
              );
            });
      }),
    );
  }
}
