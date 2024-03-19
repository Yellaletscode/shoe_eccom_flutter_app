import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: const TextField(
        controller: null,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(
                  0xffF6F7FA,
                ),
              ),
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffF6F7FA))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffF6F7FA))),
            hintText: 'Looking For shoes',
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }
}
