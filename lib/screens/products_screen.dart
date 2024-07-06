import 'package:flutter/material.dart';
import 'package:shop_smart/stuff/reusables.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.addToCart});

  final void Function(String item, double price) addToCart;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
        title: const Text("Catalogue",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: const Color(0xffFFFAFA),
      body: ListView(
        children: [
          ReusableCard(
              item: 'Sleeveless yellow dress',
              price: 50.00,
              addToCart: widget.addToCart),
          ReusableCard(
              item: 'Doc. Martens Shoe',
              price: 300.00,
              addToCart: widget.addToCart),
          ReusableCard(
              item: 'Blanket and Pillow',
              price: 150.75,
              addToCart: widget.addToCart),
          ReusableCard(
              item: 'Customized book and pen',
              price: 75,
              addToCart: widget.addToCart),
          ReusableCard(
              item: 'Keyholder', price: 0.85, addToCart: widget.addToCart),
          ReusableCard(
              item: 'Apple Vision Pro',
              price: 1000.00,
              addToCart: widget.addToCart),
          ReusableCard(
              item: 'Electric kettle',
              price: 75.00,
              addToCart: widget.addToCart),
          ReusableCard(
              item: 'Oraimo original charger',
              price: 0.50,
              addToCart: widget.addToCart),
          ReusableCard(
              item: 'Hingees hoodie',
              price: 45.00,
              addToCart: widget.addToCart),
        ],
      ),
    );
  }
}
