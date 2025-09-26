// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String productID;
  final String productName;
  final String productDescription;
  final String petCategory;
  final String petSubCategory;
  final String productCategory;
  final double price;
  final String quantity;
  final List<String> imageURLs;
  final int daysToDeliver;
  const Product({
    required this.productID,
    required this.productName,
    required this.productDescription,
    required this.petCategory,
    required this.petSubCategory,
    required this.productCategory,
    required this.price,
    required this.quantity,
    required this.imageURLs,
    required this.daysToDeliver,
  });
}
