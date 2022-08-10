import 'dart:convert';

class ProductModel {
String? id;
String? price;
String? name;
String? fertilization;
String? flowering;
String? irrigation;
String? sellerId;
String? sunLight;
String? url;
  ProductModel({
    this.id,
    this.price,
    this.name,
    this.fertilization,
    this.flowering,
    this.irrigation,
    this.sellerId,
    this.sunLight,
    this.url,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'name': name,
      'fertilization': fertilization,
      'flowering': flowering,
      'irrigation': irrigation,
      'sellerId': sellerId,
      'sunLight': sunLight,
      'url': url,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      price: map['price'],
      name: map['name'],
      fertilization: map['fertilization'],
      flowering: map['flowering'],
      irrigation: map['irrigation'],
      sellerId: map['sellerId'],
      sunLight: map['sunLight'],
      url: map['url'],
    );
  }


}

