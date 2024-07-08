import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/api_model.dart';

class ProductTile extends StatefulWidget {
  const ProductTile(
      {super.key,
      required this.item,
      required this.price,
      required this.addToCart});
  final String item;
  final double price;
  final Function(String item, double price) addToCart;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  late final Product product;
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
        color: Colors.white,
        elevation: 0,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          // leading: CircleAvatar(backgroundColor: Colors.grey[200], radius: 25),
          leading: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.cover,
              )),
          title: Text(product.name,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          subtitle: Text("\$ ${product.buyingPrice}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              )),
          trailing: IconButton(
            icon: Icon(
              isAddedToCart
                  ? Icons.done_outlined
                  : Icons.add_shopping_cart_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                isAddedToCart = !isAddedToCart;
                if (isAddedToCart) {
                  widget.addToCart(widget.item, widget.price);
                }
              });
            },
          ),
        ));
  }
}
