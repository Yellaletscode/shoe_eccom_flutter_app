import 'package:flutter/material.dart';

class AppbarTitleWidget extends StatelessWidget {
  final bool isThereSubTitle;
  final String mainTitle;
  const AppbarTitleWidget({
    super.key,
    required this.isThereSubTitle,
    required this.mainTitle,
  });

  @override
  Widget build(BuildContext context) {
    return isThereSubTitle
        ? Column(
            children: [
              const Text(
                'Shop Location',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.grey),
              ),
              Text(
                mainTitle,
                
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        : Text(
            mainTitle,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          );
  }
}
