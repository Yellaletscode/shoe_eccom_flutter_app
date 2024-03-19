import 'package:flutter/material.dart';
import '/core/constants/constants.dart';
import '/feature/screens/widgets/custom_app_bar.dart';
import '/feature/screens/widgets/shoe_container_widget.dart';
import '/models/product_data_model.dart';

import 'shoe_detail.dart';

class SheoStatusScreen extends StatelessWidget {
  final String title;
  final bool isPopular;
  final List<ProductDataModel> data;
  const SheoStatusScreen(
      {super.key,
      required this.title,
      required this.isPopular,
      required this.data});

  @override
  Widget build(BuildContext context) {
    final newArrival =
        data.where((newArrival) => newArrival.isNewArrival == true).toList();
    final screenSize = MediaQuery.of(context).size;

    print(data);
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: CustomAppBar(
          mainTitle: title,
          leadingIcon: Icons.arrow_back,
          onPressed: () {},
          onMenuPressed: () => Navigator.pop(context),
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            childAspectRatio: 0.68,
          ),
          itemCount: isPopular ? data.length : newArrival.length,
          itemBuilder: (context, index) {
            return 
                 GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoeDetail(
                                  model: isPopular
                                      ? data[index].model
                                      : newArrival[index].model,
                                  description: isPopular
                                      ? data[index].description
                                      : newArrival[index].description,
                                  price: isPopular
                                      ? data[index].price
                                      : newArrival[index].price,
                                  imageUrl: isPopular
                                       ? data[index].imageUrl
                                      : newArrival[index].imageUrl,
                                  sizes: isPopular
                                      ? data[index].sizes
                                      : newArrival[index].sizes,
                                  title: isPopular
                                      ? data[index].title
                                      : newArrival[index].title, id: isPopular
                                ? data[index].id
                                : newArrival[index].id,
                                ))),
                    child: ShoeContainerWidget(
                      shoeImageUrl: isPopular ? data[index].imageUrl: newArrival[index].imageUrl,
                      shoeBrand: isPopular ? data[index].model : newArrival[index].model,
                      shoePrice: isPopular
                          ? data[index].price
                          : newArrival[index].price,
                    ),
                  );
          }),
    );
  }
}
