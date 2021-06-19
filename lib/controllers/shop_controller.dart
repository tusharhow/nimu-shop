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
              'https://images.unsplash.com/photo-1617997455403-41f333d44d5b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=60',
          productName: 'iPhone 12'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage:
              'https://images.unsplash.com/photo-1621501473804-cda119b38378?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=60',
          productName: 'iPhone 7 Plus'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage:
              'https://images.unsplash.com/photo-1604399327328-6da46cf40b96?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=60',
          productName: 'iPhone 10 Pro'),
      Product(
          id: 4,
          price: 40,
          productDescription: 'some description about product',
          productImage:
              'https://images.unsplash.com/photo-1621501473804-cda119b38378?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=60',
          productName: 'iPhone 7 Plus'),
          Product(
          id: 5,
          price: 30,
          productDescription: 'some description about product',
          productImage:
              'https://images.unsplash.com/photo-1617997455403-41f333d44d5b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=60',
          productName: 'iPhone 12'),
    ];

    products.value = productResult;
  }
}
