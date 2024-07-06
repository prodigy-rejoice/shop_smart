import 'package:flutter/material.dart';
import 'package:shop_smart/screens/checkout_order.dart';
import '../model/cart_class.dart';
import '../stuff/reusables.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key, required this.selectedItems});

  List<CartItem> selectedItems = [];
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice() {
    return widget.selectedItems
        .fold(0.00, (total, item) => total + item.itemPrice);
  }

  void onDismissed(int index) {
    setState(() {
      widget.selectedItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
        title: const Text("Cart",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(
              Icons.shopping_cart_checkout_outlined,
              color: Colors.white,
              size: 26,
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xffFFFAFA),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: widget.selectedItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      selectedItem: widget.selectedItems[index].itemName,
                      selectedItemPrice: widget.selectedItems[index].itemPrice,
                      onDismissed: () => onDismissed(index),
                    );
                  }),
            ),
            // const Spacer(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.black)),
                      Text("\$ ${totalPrice().toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  const SizedBox(height: 7),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CheckoutOrder()));
                    },
                    child: const Text(
                      "Proceed to Checkout...",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
