import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      body: Column(
        children: [
          GetX<CartController>(
            builder: (controller) {
              return Expanded(
                child: SizedBox(
                  height: 700,
                  child: ListView.builder(
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: GetX<CartController>(
                          builder: (controller) {
                            return Text(
                              '${controller.cartItems[index].productName}',
                              style: TextStyle(fontSize: 18),
                            );
                          },
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          color: Colors.green,
                          onPressed: () {
                            cartController
                                .removeFromCart(controller.cartItems[index]);
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          Container(
            color: Colors.green,
            height: 50,
            width: double.infinity,
            child: GetX<CartController>(builder: (controller) {
              return Center(
                child: Text(
                  'Total Pricice \$${controller.totalPrice}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
