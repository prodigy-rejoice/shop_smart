import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/api_model.dart';
import 'package:http/http.dart' as http;
import '../stuff/product_tile.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, this.addToCart});

  final void Function(String item, double price)? addToCart;

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

  // Future<void> fetchProducts() async {
  //   const url =
  //       '$baseUrl?organization_id=$organizationId&reverse_sort=false&page=1&size=25&Appid=$appId&Apikey=$apiKey';
  //   try {
  //     http.Response response = await http.get(Uri.parse(url));
  //     print(response.statusCode);
  //     print(url);
  //     if (response.statusCode == 200) {
  //       String data = response.body;
  //       print('Response received: $data');
  //       Map<String, dynamic> jsonData = json.decode(data);
  //       if (jsonData.containsKey('items')) {
  //         List<dynamic> productData = jsonData['items'];
  //         List<Product> fetchedProducts =
  //             productData.map((value) => Product.fromJson(value)).toList();
  //         setState(() {
  //           products = fetchedProducts;
  //           print('Products fetched: ${products.length}');
  //         });
  //       } else {
  //         print('Unexpected JSON format: $jsonData');
  //       }
  //     } else {
  //       print('Failed to load products: ${response.statusCode}');
  //       throw Exception('Failed to load products');
  //     }
  //   } catch (e) {
  //     print('Error fetching products: $e');
  //   }
  // }

  Future<void> fetchProducts() async {
    const url =
        '$baseUrl?organization_id=$organizationId&reverse_sort=false&page=1&size=25&Appid=$appId&Apikey=$apiKey';
    try {
      http.Response response = await http.get(Uri.parse(url));
      print(response.statusCode);
      print(url);
      if (response.statusCode == 200) {
        String data = response.body;
        print('Response received: $data');
        Map<String, dynamic> jsonData = json.decode(data);
        if (jsonData.containsKey('items')) {
          List<dynamic> productData = jsonData['items'];
          for (var product in productData) {
            print('Product: $product');
          }
          List<Product> fetchedProducts =
              productData.map((value) => Product.fromJson(value)).toList();
          setState(() {
            products = fetchedProducts;
            print('Products fetched: ${products.first.photos!.first.url}');
          });
        } else {
          print('Unexpected JSON format: $jsonData');
        }
      } else {
        print('Failed to load products: ${response.statusCode}');
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple,
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
    );
  }
}
