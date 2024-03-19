import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import 'common_text.dart';

class ShoeContainerWidget extends StatelessWidget {
  final String shoeImageUrl;
  final String shoeBrand;
  final double shoePrice;
  const ShoeContainerWidget({
    super.key,
    required this.shoeImageUrl,
    required this.shoeBrand,
    required this.shoePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: Constants.pureWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              shoeImageUrl,
              width: MediaQuery.of(context).size.width * 0.38,
              // fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CommonText(),
          const SizedBox(
            height: 10,
          ),
          Text(
            shoeBrand,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.3,
            ),
          ),
          Text(
            '\$$shoePrice',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
