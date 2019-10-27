import 'package:meta/meta.dart';
import 'package:shopflut_blocv1/models/product_model.dart';

@immutable
abstract class FavoritesState {}

class InitialFavoritesState extends FavoritesState {}

class FavoritesProductLoaded extends FavoritesState {
  final List<ProductModel> favoritesProducts;
  FavoritesProductLoaded({@required this.favoritesProducts});
}

class LoadingFavoritesItem extends FavoritesState {}
