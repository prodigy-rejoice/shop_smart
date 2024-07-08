// import 'dart:convert';
//
// import 'package:shop_smart/model/api_model.dart';
//
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   static const String apiKey =
//       "4ab74e8f086d421bba03fa420e61db3720240708020303051772";
//   static const String appId = "S062A2NYSR21UKZ";
//   static const String organizationId = "cbbdd49c95fa402a9c8a70d153ea73b5";
//   static const String baseUrl = "https://api.timbu.cloud/products";
//
//   Future<List<Product>> fetchProducts() async {
//     const url =
//         '$baseUrl?organization_id=$organizationId&reverse_sort=false&page=1&size=25&Appid=$appId&Apikey=$apiKey';
//     print('Fetching products from URL: $url');
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       print('Response received: ${response.body}');
//       List jsonResponse = json.decode(response.body)['data'];
//       return jsonResponse.map((product) => Product.fromJson(product)).toList();
//     } else {
//       print('Failed to load products: ${response.statusCode}');
//       throw Exception('Failed to load products');
//     }
//   }
// }
//
// //https://api.timbu.cloud/products?organization_id=cbbdd49c95fa402a9c8a70d153ea73b5&Appid=S062A2NYSR21UKZ&Apikey=4ab74e8f086d421bba03fa420e61db3720240708020303051772#
