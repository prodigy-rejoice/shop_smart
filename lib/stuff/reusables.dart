import 'package:flutter/material.dart';
import 'package:shop_smart/model/cart_class.dart';

class ReusableCard extends StatefulWidget {
  const ReusableCard(
      {super.key,
      required this.item,
      required this.price,
      required this.addToCart});
  final String item;
  final double price;
  final Function(String item, double price) addToCart;

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
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
          leading: CircleAvatar(backgroundColor: Colors.grey[200], radius: 25),
          title: Text(widget.item,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          subtitle: Text("\$ ${widget.price}",
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

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.selectedItem,
    required this.selectedItemPrice,
    required this.onDismissed,
  });

  final String selectedItem;
  final double selectedItemPrice;
  final Function() onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (DismissDirection direction) {
        onDismissed();
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: ListTile(
          title: Text(selectedItem,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
          trailing: Text("\$ $selectedItemPrice",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 19,
                color: Colors.black,
              )),
        ),
      ),
    );
  }
}
