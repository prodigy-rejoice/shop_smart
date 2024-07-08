import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_smart/screens/details.dart';
import '../model/api_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  String getImageUrl(String? urLink) {
    String? url =
        'https://api.timbu.cloud/images/$urLink?organization_id=cbbdd49c95fa402a9c8a70d153ea73b5&reverse_sort=false&page=1&size=25&Appid=S062A2NYSR21UKZ&Apikey=4ab74e8f086d421bba03fa420e61db3720240708020303051772';
    return url;
  }

  @override
  Widget build(BuildContext context) {
    String price = 'Price not available';
    if (product.currentPrice != null && product.currentPrice!.isNotEmpty) {
      var ngnPrices = product.currentPrice![0].NGN;
      if (ngnPrices != null && ngnPrices.isNotEmpty) {
        price = ngnPrices[0].toString();
      }
    }
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(
                        product: product,
                      )));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: getImageUrl(
                    product.photos!.isNotEmpty ? product.photos![0].url : ''),
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            ListTile(
                title: Text(
                  product.name ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("\$ $price")
                // Text(product.current_price?.firstOrNull?.NGN?.firstOrNull),
                ),
          ],
        ),
      ),
    );
  }
}
