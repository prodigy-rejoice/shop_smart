import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/api_model.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.product});

  final Product product;
  String getBaseUrl(String urLink) {
    String url =
        'https://api.timbu.cloud/images/$urLink?organization_id=cbbdd49c95fa402a9c8a70d153ea73b5&reverse_sort=false&page=1&size=25&Appid=S062A2NYSR21UKZ&Apikey=4ab74e8f086d421bba03fa420e61db3720240708020303051772';
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple,
        title: const Text("Details",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500)),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Center(
                child: Text(
              product.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            subtitle: Text(
              product.description ?? '',
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const Spacer(),
          AspectRatio(
            aspectRatio: 0.7,
            child: CachedNetworkImage(
              imageUrl: getBaseUrl(
                  product.photos!.isNotEmpty ? product.photos![0].url : ''),
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
