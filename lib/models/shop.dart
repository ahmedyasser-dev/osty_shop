import 'package:flutter/cupertino.dart';
import 'package:osty_shop/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    //product1
    Product(
      name: "Hat",
      description: 'It\'s a very nice hat FYI',
      imgPath: 'assets/images/hat.png',
      price: 399,
    ),
    Product(
      name: "Shoe",
      description: 'It\'s a very nice shoe FYI',
      imgPath: 'assets/images/shoes.png',
      price: 999,
    ),
    Product(
      name: "Phone",
      description: 'It\'s a very nice phone FYI',
      imgPath: 'assets/images/phone.png',
      price: 1999,
    ),
    Product(
      name: "T-shirt",
      description: 'It\'s a very nice T-shirt FYI',
      imgPath: 'assets/images/shirt.png',
      price: 599,
    ),
  ];

  //user cart
  final List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user's cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  //remove item from the cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
