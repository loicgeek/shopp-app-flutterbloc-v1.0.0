import 'package:meta/meta.dart';
import 'package:shopflut_blocv1/models/product_model.dart';

@immutable
abstract class FavoritesEvent {}

class NewFavoriteProduct extends FavoritesEvent {
  final ProductModel productModel;

  NewFavoriteProduct({@required this.productModel});
}

class RemoveFavoriteProduct extends FavoritesEvent {
  final ProductModel productModel;

  RemoveFavoriteProduct({@required this.productModel});
}

class LoadFavoriteProducts extends FavoritesEvent {}
