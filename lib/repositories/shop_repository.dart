import 'package:shopflut_blocv1/models/product_model.dart';
import 'package:meta/meta.dart';

final List<ProductModel> products = [
  ProductModel(id: '1', name: 'Shoes', quantity: 12, price: 70),
  ProductModel(id: '2', name: 'Dress', quantity: 2, price: 125),
  ProductModel(id: '3', name: 'Cloth', quantity: 10, price: 150),
  ProductModel(id: '4', name: 'Watch', quantity: 0, price: 500),
  ProductModel(id: '5', name: 'Umbrella', quantity: 30, price: 100),
  ProductModel(id: '6', name: 'car', quantity: 2, price: 5000),
];

final List<ProductModel> favoritesProducts = [];

class ShopRepository {
  Future<List<ProductModel>> getAllProducts() {
    return Future.delayed(Duration(milliseconds: 500), () {
      return products;
    });
  }

  Future<List<ProductModel>> getFavoritesProducts() {
    return Future.delayed(Duration(milliseconds: 500), () {
      return favoritesProducts;
    });
  }

  Future<List<ProductModel>> searchProducts(String query) {
    return Future.delayed(Duration(milliseconds: 500), () {
      List<ProductModel> result = products.where((p) {
        return p.name.contains(query);
      });
      return result;
    });
  }

  Future<void> addToFavorites({@required ProductModel productModel}) {
    return Future.delayed(Duration(milliseconds: 500), () {
      favoritesProducts.add(productModel);
    });
  }

  Future<void> removeFromFavorites({@required ProductModel productModel}) {
    return Future.delayed(Duration(milliseconds: 500), () {
      favoritesProducts.remove(productModel);
    });
  }
}
