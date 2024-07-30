import 'package:flutter/material.dart';
import 'package:osty_shop/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
            ),

            const SizedBox(
              height: 25,
            ),

            //title
            const Text(
              'Osty Shop',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //sub title
            Text(
              'Premium quality products',
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //button
            MyButton(
              onTap: () => Navigator.pushNamed(
                context,
                '/shoppage',
              ),
              child: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
