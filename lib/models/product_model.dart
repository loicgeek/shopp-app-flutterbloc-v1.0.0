import 'package:equatable/equatable.dart';

class ProductModel implements Equatable {
  String id;
  String name;
  double price;
  int quantity;

  ProductModel({this.id, this.name, this.price, this.quantity});

  ProductModel.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        quantity = json['quantity'];

  @override
  String toString() {
    // TODO: implement toString
    return id + "-" + name;
  }

  @override
  // TODO: implement props
  List<Object> get props => [id];
}
