import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimu_shop/controllers/cart_controller.dart';
import 'package:nimu_shop/controllers/shop_controller.dart';
import 'package:nimu_shop/views/cart_page.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nimu Shop'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                      '${controller.products[index].productImage}'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${controller.products[index].productName}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    '${controller.products[index].productDescription}',
                                  ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${controller.products[index].price}',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black54),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                  ),
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                  child: Text('Add to Cart'),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => CartPage(), transition: Transition.rightToLeft);
        },
        icon: Icon(Icons.shopping_basket_rounded),
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              '${controller.count}',
            );
          },
        ),
      ),
    );
  }
}
