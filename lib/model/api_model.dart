// class Product {
//   final int id;
//   final String title;
//   final double price;
//   final String description;
//   final String image;
//
//   Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.image,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       title: json['name'],
//       price: json['price'].toDouble(),
//       description: json['description'],
//       image: json['photos'],
//     );
//   }
// }


class Product {
  final String name;
  final String description;
  final String uniqueId;
  final String urlSlug;
  final bool isAvailable;
  final bool isService;
  final int availableQuantity;
  final double? sellingPrice;
  final double? discountedPrice;
  final double? buyingPrice;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.uniqueId,
    required this.urlSlug,
    required this.isAvailable,
    required this.isService,
    required this.availableQuantity,
    this.sellingPrice,
    this.discountedPrice,
    this.buyingPrice,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      uniqueId: json['unique_id'],
      urlSlug: json['url_slug'],
      isAvailable: json['is_available'],
      isService: json['is_service'],
      availableQuantity: json['available_quantity'],
      sellingPrice: json['selling_price']?.toDouble(),
      discountedPrice: json['discounted_price']?.toDouble(),
      buyingPrice: json['buying_price']?.toDouble(),
      imageUrl: json['image_url'],
    );
  }
}