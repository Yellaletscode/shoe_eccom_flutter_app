import 'package:flutter/material.dart';
import 'package:shoe_eccom/providers/cart_provider.dart';
import 'package:shoe_eccom/providers/product_provider.dart';
import '/core/constants/constants.dart';
import '/feature/screens/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
      final cartProduct = Provider.of<CartProvider>(context).cart;
   

    final deleteFromCart = cartProduct.firstWhere((items) => items['id'],);
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: CustomAppBar(
          icon: Icons.shopping_cart,
          mainTitle: 'Cart',
          onMenuPressed: () => print('menu'),
          onPressed: () => print('cart'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: ListView.builder(
                itemCount: cartProduct.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration:
                          const BoxDecoration(color: Constants.pureWhite),
                      child: Image.asset(
                        cartProduct[index]['imageUrl'],
                      ),
                    ),
                    title: Text(
                      cartProduct[index]['model'],
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      'Size: ${cartProduct[index]['size']}',
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context)
                            .removeProductFromCart(deleteFromCart);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                })),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Constants.pureWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      '\$1250',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shopping',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      '\$1250',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Cost',
                      style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      '\$1250',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () => print('Checkout'),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
