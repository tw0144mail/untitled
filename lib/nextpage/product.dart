class Product {
  //產品名稱
  String? name;

  //產品描述
  String? desc;

  //產品價格
  int price;

  //產品庫存
  int? stock;

  Product({this.name, this.desc, required this.price, this.stock});
}