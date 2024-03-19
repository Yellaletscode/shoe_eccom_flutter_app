import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'BEST SELLER',
      style: TextStyle(
        letterSpacing: 1.3,
        fontSize: 16,
        color: Constants.primaryColor,
      ),
    );
  }
}
