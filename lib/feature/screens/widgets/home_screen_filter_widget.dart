import 'package:flutter/material.dart';


class HomeScreenFilterWidget extends StatelessWidget {
  const HomeScreenFilterWidget({
    super.key,
    required this.selectedFilter,
    required this.filter,
    required this.brandUrl
  });

  final String selectedFilter;
  final String filter;
  final String brandUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: selectedFilter != filter
            ? const EdgeInsets.all(15)
            : const EdgeInsets.only(right: 15, top: 2.5, bottom: 2.5, ),
        decoration: BoxDecoration(
          borderRadius: selectedFilter == filter
              ? const BorderRadius.all(
                  Radius.circular(50),
                )
              : null,
          shape:
              selectedFilter != filter ? BoxShape.circle : BoxShape.rectangle,
          color:
              selectedFilter == filter ? const Color(0xff5A9DE1) : Colors.white,
        ),
        child: selectedFilter == filter
            ? Row(
             
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    // width: MediaQuery.of(context).size.width * 0.25,

                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),

                    // decoration: BoxDecoration(color: Constants.pureWhite, shape: BoxShape.circle),
                    child: Image.asset(
                      brandUrl,
                    ),
                  ),
                  Text(
                    filter,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Image.asset(brandUrl),);
  }
}
