import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nimu_shop/constrants.dart';
import 'package:nimu_shop/controllers/cart_controller.dart';
import 'package:nimu_shop/controllers/shop_controller.dart';
import 'package:velocity_x/velocity_x.dart';

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
          Stack(
            children: [
              VxArc(
                arcType: VxArcType.CONVEX,
                height: 20,
                edge: VxEdge.TOP,
                child: Container(
                  height: 250,
                  width: 400,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    // borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Voucher',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green,
                        ),
                        height: 45,
                        child: GetX<CartController>(
                          builder: (controller) {
                            return Center(
                              child: Text(
                                'Total Pricice \$${controller.totalPrice}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 300,
                        child: Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 300,
                        child: Center(
                          child: Text(
                            'Checkout with PayPal',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
