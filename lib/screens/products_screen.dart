import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_smart/scratch.dart';
import '../model/api_model.dart';
import '../stuff/product_tile.dart';
import 'package:http/http.dart' as http;

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.addToCart});

  final void Function(String item, double price) addToCart;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  static const String apiKey =
      "4ab74e8f086d421bba03fa420e61db3720240708020303051772";
  static const String appId = "S062A2NYSR21UKZ";
  static const String organizationId = "cbbdd49c95fa402a9c8a70d153ea73b5";
  static const String baseUrl = "https://api.timbu.cloud/products";

  Future<List<Product>> fetchProducts() async {
    const url =
        '$baseUrl?organization_id=$organizationId&reverse_sort=false&page=1&size=25&Appid=$appId&Apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(url);
    if (response.statusCode == 200) {
      String data = response.body;
      print('Response received: $data');
      List<dynamic> jsonData = json.decode(data);
      List<Product> products =
          jsonData.map((value) => Product.fromJson(value)).toList();
      return products;
    } else {
      print('Failed to load products: ${response.statusCode}');
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          }),
      // body: ListView(
      //   children: [
      //     ProductTile(
      //       item: 'Sleeveless yellow dress',
      //       price: 50.00,
      //       // addToCart: widget.addToCart,
      //       addToCart: (item, price) {
      //         widget.addToCart(item, price);
      //       },
      //     ),
      //     ProductTile(
      //         item: 'Doc. Martens Shoe',
      //         price: 300.00,
      //         addToCart: widget.addToCart),
      //     ProductTile(
      //         item: 'Blanket and Pillow',
      //         price: 150.75,
      //         addToCart: widget.addToCart),
      //     ProductTile(
      //         item: 'Customized book and pen',
      //         price: 75,
      //         addToCart: widget.addToCart),
      //     ProductTile(
      //         item: 'Keyholder', price: 0.85, addToCart: widget.addToCart),
      //     ProductTile(
      //         item: 'Apple Vision Pro',
      //         price: 1000.00,
      //         addToCart: widget.addToCart),
      //     ProductTile(
      //         item: 'Electric kettle',
      //         price: 75.00,
      //         addToCart: widget.addToCart),
      //     ProductTile(
      //         item: 'Oraimo original charger',
      //         price: 0.50,
      //         addToCart: widget.addToCart),
      //     ProductTile(
      //         item: 'Hingees hoodie',
      //         price: 45.00,
      //         addToCart: widget.addToCart),
      //   ],
      // ),
    );
  }
}
