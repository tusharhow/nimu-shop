import 'package:get/state_manager.dart';
import 'package:nimu_shop/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed((Duration(seconds: 1)));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage:
              'https://images.unsplash.com/photo-1622840593702-b6973ae904b6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=60',
          productName: 'iPhone 12'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage:
              'https://images.unsplash.com/photo-1622840593702-b6973ae904b6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=60',
          productName: 'iPhone 7 Plus'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage:
              'https://images.unsplash.com/photo-1622840593702-b6973ae904b6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=60',
          productName: 'iPhone 10 Pro'),
    ];

    products.value = productResult;
  }
}
