import 'package:flutter/material.dart';
import 'package:shop_smart/stuff/rounded_icon.dart';

class CartTile extends StatefulWidget {
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
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  int _quantity = 1;

  void increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      _quantity > 1 ? _quantity-- : widget.onDismissed;
    });
  }

  double get totalQuantityPrice => widget.selectedItemPrice * _quantity;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (DismissDirection direction) {
          widget.onDismissed();
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 2),
          color: Colors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.selectedItem,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              onPressed: widget.onDismissed,
                              icon: const Icon(
                                Icons.delete_outline_outlined,
                                size: 18,
                                color: Colors.grey,
                              ),
                            ),
                            const Text(
                              "REMOVE",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "\$ ${totalQuantityPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RoundedIconButton(
                            icon: Icons.remove, onPress: decreaseQuantity),
                        const SizedBox(width: 2),
                        Text(_quantity.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black,
                            )),
                        const SizedBox(width: 2),
                        RoundedIconButton(
                            icon: Icons.add, onPress: increaseQuantity)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
