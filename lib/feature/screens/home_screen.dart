import 'package:flutter/material.dart';
import '/core/constants/constants.dart';
import '/feature/screens/mobile_screen.dart';
import '/feature/screens/shoe_detail.dart';
import '/feature/screens/shoe_status_screen.dart';
import '/feature/screens/widgets/custom_app_bar.dart';
import '/feature/screens/widgets/home_screen_filter_widget.dart';
import '/feature/screens/widgets/search_widget.dart';
import '/feature/screens/widgets/shoe_container_widget.dart';
import '/providers/product_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filters = const ['Nike', 'Adidas', 'Puma', 'Converse'];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();

    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final loadedShoes = Provider.of<ProductProvider>(context).shoeItems;
    final shoeData = loadedShoes.expand((shoeData) => shoeData.data).toList();
    return Scaffold(
        backgroundColor: Constants.scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: CustomAppBar(
            mainTitle: 'Jigjiga, Ethiopia',
            isSubtitle: true,
            icon: Icons.shopping_bag,
            onMenuPressed: () => print('menu'),
            onPressed: () {},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Constants.verticalSpace,
                const SearchWidget(),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    itemCount: loadedShoes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = loadedShoes[index].company;
                            });
                          },
                          child: HomeScreenFilterWidget(
                            selectedFilter: selectedFilter,
                            filter: loadedShoes[index].company,
                            brandUrl: loadedShoes[index].companyLogoUrl,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ShoeStatus(
                  shoeStatus: 'Popular Shoes',
                  onpressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SheoStatusScreen(
                        title: 'Poular Shoes',
                        isPopular: true,
                        data: shoeData,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.7,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: shoeData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShoeDetail(
                                model: shoeData[index].model,
                                description: shoeData[index].description,
                                price: shoeData[index].price,
                                imageUrl: shoeData[index].imageUrl,
                                sizes: shoeData[index].sizes,
                                title: shoeData[index].title, id: shoeData[index].id,
                              ),
                            ),
                          ),
                          child: ShoeContainerWidget(
                            shoeImageUrl: shoeData[index].imageUrl,
                            shoeBrand: shoeData[index].model,
                            shoePrice: shoeData[index].price,
                          ),
                        );
                      }),
                ),
                ShoeStatus(
                  // ignore: prefer_const_constructors
                  shoeStatus: 'New Arrivals',
                  onpressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SheoStatusScreen(
                        title: 'New Arrivals',
                        isPopular: false,
                        data: shoeData,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 5,
                  ),
                  decoration: const BoxDecoration(
                    color: Constants.pureWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'BEST CHOICE',
                            style: TextStyle(color: Constants.primaryColor),
                          ),
                          Text(
                            shoeData[1].model,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            '\$${shoeData[1].price},',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Image.asset(
                          shoeData[1].imageUrl,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
