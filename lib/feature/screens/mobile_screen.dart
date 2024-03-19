import 'package:flutter/material.dart';
import '/core/constants/constants.dart';
import '/feature/screens/cart_screen.dart';
import '/feature/screens/favourite_screen.dart';
import '/feature/screens/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '/feature/screens/notification_screen.dart';
import '/feature/screens/profile_screen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen>
    with WidgetsBindingObserver {
  int _page = 0;
  late PageController pageController;

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        animationCurve: Curves.linearToEaseOut,
        animationDuration: const Duration(milliseconds: 200),
        items: [
          Icon(Icons.home,
              color: _page == 0
                  ? Constants.primaryColor
                  : const Color(0xFF3B3A3A)),
          Icon(
            Icons.favorite,
            color:
                _page == 1 ? Constants.primaryColor : const Color(0xFF3B3A3A),
          ),
          Icon(
            Icons.shopping_cart,
            color:
                _page == 2 ? Constants.primaryColor : const Color(0xFF3B3A3A),
          ),
          Icon(
            Icons.notifications,
            color:
                _page == 3 ? Constants.primaryColor : const Color(0xFF3B3A3A),
          ),
          Icon(
            Icons.person,
            color:
                _page == 4 ? Constants.primaryColor : const Color(0xFF3B3A3A),
          ),
        ],
        onTap: navigationTapped,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          FavouriteScreen(),
          CartScreen(),
          NotificationScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}

class ShoeStatus extends StatelessWidget {
  final String shoeStatus;
  final Function() onpressed;
  const ShoeStatus({
    super.key,
    required this.shoeStatus, required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          shoeStatus,
          style: const TextStyle(
            letterSpacing: 1.3,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
         TextButton(
          onPressed: onpressed,
          child: Text(
            'See all',
            style: TextStyle(
              fontSize: 18,
              color: Constants.primaryColor,
              letterSpacing: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
