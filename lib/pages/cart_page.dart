import 'package:flutter/material.dart';
import 'package:osty_shop/components/my_button.dart';
import 'package:osty_shop/models/product.dart';
import 'package:osty_shop/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart fun
  void removeItemFromCart(BuildContext context, Product product) {
    //show a dialog box to ask the user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from your cart?'),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text('User wants to pay! Connect this app to your backend'),
      ),
    );
  }

  //user pressed pay button but the cart is empty
  void handlePayButtonPressedError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text('Your cart is empty!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Cart',
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),

          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text(
                    'Your cart is empty..',
                    style: TextStyle(fontSize: 20),
                  ))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      return Container(
                        margin: const EdgeInsets.only(
                          bottom: 10,
                          right: 10,
                          left: 10,
                        ),
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => removeItemFromCart(context, item),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => cart.isEmpty
                  ? handlePayButtonPressedError(context)
                  : payButtonPressed(context),
              child: const Text('Pay now'),
            ),
          )
        ],
      ),
    );
  }
}
