
class Wishh {
  final String name;
  final String thumb;
  final String price;
  final String product_id;
  final String Special;
  final String Stock;



  Wishh({required this.name, required this.thumb,required this.price,required this.product_id,required this.Special,required this.Stock});
  factory Wishh.fromJson(Map<String, dynamic> json) {


    return Wishh(
        name:json['name'],
        thumb: json['thumb'],
        price: json['price'],
        product_id: json['product_id'],
        Special:json['special'].toString(),
        Stock: json['stock']
    );
  }
}