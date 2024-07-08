class CartItem {
  final String itemName;
  final double itemPrice;
  int quantity;

  CartItem(
      {required this.itemName, required this.itemPrice, this.quantity = 1});
}
