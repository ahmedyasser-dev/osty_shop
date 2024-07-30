import 'package:flutter/material.dart';
import 'package:osty_shop/components/my_drawer.dart';
import 'package:osty_shop/components/my_product_tile.dart';
import 'package:osty_shop/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products form Shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Shop',
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cartpage'),
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
            )
          ],
        ),
        drawer: const MyDrawer(),
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),

            //shop subtitle
            const Center(
              child: Text(
                'Pick from a selected list of premium products',
              ),
            ),

            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  //get each product from Shop
                  final product = products[index];

                  //return as a product tile UI
                  return MyProductTile(product: product);
                },
              ),
            ),
          ],
        ));
  }
}
