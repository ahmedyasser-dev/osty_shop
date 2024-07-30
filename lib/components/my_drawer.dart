import 'package:flutter/material.dart';
import 'package:osty_shop/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            //Drawer Header:logo
            DrawerHeader(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //shop tile
            MyListTile(
              text: 'Shop',
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),

            //cart tile
            MyListTile(
              text: 'Cart',
              icon: Icons.shopping_cart_outlined,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cartpage');
              },
            ),
          ]),

          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/intropage',
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
