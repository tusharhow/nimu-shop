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
                                  Text(
                                    '${controller.products[index].productName}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.network(
                                      '${controller.products[index].productImage}'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${controller.products[index].productDescription}',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () {
                                cartController.addToCart(controller.products[index]);
                              },
                              child: Text('Add to Cart'),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Text(
                              '\$${controller.products[index].price}',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total Amount \$ ${controller.totalPrice}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              );
            }),
            SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(CartPage());
        },
        icon: Icon(Icons.card_travel),
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
