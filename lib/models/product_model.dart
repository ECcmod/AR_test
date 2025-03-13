class Product {
  final int id;
  final String name;
  final double price;
  final String arModel;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.arModel,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    price: json['price'],
    arModel: json['arModel'],
    imageUrl: json['imageUrl'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'arModel': arModel,
    'imageUrl': imageUrl,
  };
}

class ARObjectData {
  final String modelPath;
  final List<double> transformation;

  ARObjectData({required this.modelPath, required this.transformation});

  factory ARObjectData.fromJson(Map<String, dynamic> json) => ARObjectData(
    modelPath: json['modelPath'],
    transformation: List<double>.from(json['transformation']),
  );

  Map<String, dynamic> toJson() => {
    'modelPath': modelPath,
    'transformation': transformation,
  };
}
