class ProductModel {
  late String productName;

  late String productImage;

  late String productPrice;

  late String productDescription;

  ProductModel({
    required this.productDescription,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  }) ;
  ProductModel.fromJson(Map<String,dynamic>json)
  {
    productName = json['productName'] ;
    productImage = json['productImage'] ;
    productPrice = json['productPrice'].toString() ;
    productDescription = json['productDescription'] ;
  }
}