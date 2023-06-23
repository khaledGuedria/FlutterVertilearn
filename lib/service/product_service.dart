import 'package:day3_exemple/models/product.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ProductService {
  //HIVE
  //0 : Init
  Future<void> initHiveStorage() async {
    await getApplicationDocumentsDirectory()
        .then((dir) async => Hive.init(dir.path))
        .then((v) {
      Hive.registerAdapter(ProductAdapter());
    });
  }

  //1 : Add
  Future<void> addProduct(Product p) async {
    await Hive.openBox("products").then((productBox) => productBox.add(p));
  }

  //2 : List
  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    await Hive.openBox("products").then((productBox) {
      for (Product element in productBox.values) {
        products.add(element);
      }
    });

    return products;
  }

  //3 : Update
  Future<void> update(Product p) async {
    //await Hive.openBox("products").then((productBox) => productBox.(p));
  }

  //4 : delete
  Future<void> deleteOne(Product p) async {
    await Hive.openBox("products").then((productBox) => productBox.delete(p));
  }

  //5 : delete all
  Future<void> clear() async {
    await Hive.openBox("products").then((productBox) => productBox.clear());
  }
}
