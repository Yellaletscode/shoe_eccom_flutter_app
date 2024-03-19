import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_eccom/providers/cart_provider.dart';

import '/core/constants/constants.dart';
import '/feature/screens/cart_screen.dart';
import '/feature/screens/widgets/Common_text.dart';
import '/feature/screens/widgets/custom_app_bar.dart';

class ShoeDetail extends StatefulWidget {
  final int id;
  final String model;
  final String description;
  final double price;
  final String imageUrl;
  final String title;
  final List<int> sizes;

  const ShoeDetail({
    super.key,
    required this.model,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    required this.title, required this.id,
  });

  @override
  State<ShoeDetail> createState() => _ShoeDetailState();
}

class _ShoeDetailState extends State<ShoeDetail> {
  late int selectedSize;

  @override
  void initState() {
    super.initState();

    selectedSize = widget.sizes[0];
  }

  void addToCart() {
    Provider.of<CartProvider>(context, listen: false).addProductToCart({
      'model': widget.model,
      'price': widget.price,
      'size': selectedSize,
      'imageUrl': widget.imageUrl,
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const CartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: CustomAppBar(
          mainTitle: widget.model,
          leadingIcon: Icons.arrow_back,
          onMenuPressed: () => Navigator.pop(context),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    widget.imageUrl,
                    width: MediaQuery.of(context).size.width * 0.55,
                  ),
                ),
                Image.asset(Constants.circle, width: screenSize.width),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 25,
              ),
              width: screenSize.width,
              decoration: const BoxDecoration(
                color: Constants.pureWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonText(),
                  Constants.verticalSpace2,
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Constants.smallVerticalSpace,
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Constants.grey,
                    ),
                  ),
                  Constants.verticalSpace2,
                  const Text(
                    'Sizes',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Constants.smallVerticalSpace,
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.sizes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              print('this got tapped ${widget.sizes[index]}');
                              setState(() {
                                selectedSize = widget.sizes[index];
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: selectedSize == widget.sizes[index]
                                      ? Constants.primaryColor
                                      : Constants.scaffoldBackgroundColor,
                                  shape: BoxShape.circle),
                              child: Text(
                                '${widget.sizes[index]}',
                                style: const TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Constants.smallVerticalSpace,
                  const Divider(
                    color: Color.fromARGB(17, 84, 83, 83),
                  ),
                  Constants.verticalSpace2,
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'price',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Constants.grey,
                                  letterSpacing: 1.1),
                            ),
                            Constants.smallVerticalSpace,
                            Text(
                              '\$${widget.price}',
                              style: const TextStyle(
                                  fontSize: 23, letterSpacing: 1.1),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: addToCart,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: const BoxDecoration(
                                color: Constants.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(
                                fontSize: 23,
                                color: Constants.pureWhite,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/**
 * Best Seller
 Nike Air Jordan
 $967.800
 Air Jordan is an American brand of basketball 
shoes athletic, casual, and style clothing 
produced by Nike....
 Gallery
 Size
 38
 
 * 
 * 
 */