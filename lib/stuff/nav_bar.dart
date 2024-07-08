import 'package:flutter/material.dart';
import 'package:shop_smart/screens/cart_screen.dart';
import 'package:shop_smart/screens/products_screen.dart';
import '../model/cart_class.dart';

class ShopApp extends StatefulWidget {
  const ShopApp({super.key});

  @override
  State<ShopApp> createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  int selectedIndex = 0;
  List<CartItem> cartItems = [];

  void addToCart(String item, double price) {
    setState(() {
      cartItems.add(CartItem(itemName: item, itemPrice: price));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      ProductsScreen(addToCart: addToCart),
      CartScreen(selectedItems: cartItems),
    ];
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: const Color(0xffFAE6E7),
        elevation: 0,
        backgroundColor: Colors.white,
        selectedIndex: selectedIndex,
        onDestinationSelected: (int currentIndex) {
          setState(() {
            selectedIndex = currentIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Products",
            selectedIcon:
                Icon(Icons.shopping_cart_outlined, color: Colors.red, size: 28),
          ),
          NavigationDestination(
            icon: Icon(Icons.library_add_check_outlined),
            label: "Checkout",
            selectedIcon: Icon(Icons.library_add_check_outlined,
                color: Colors.red, size: 28),
          )
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
