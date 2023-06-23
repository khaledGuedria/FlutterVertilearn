import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late String image;
  @HiveField(4)
  late double prix;

  //constructor
  Product();
  Product.full(this.id, this.name, this.description, this.image, this.prix);
}
