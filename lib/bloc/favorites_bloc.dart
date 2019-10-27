import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shopflut_blocv1/models/product_model.dart';
import 'package:shopflut_blocv1/repositories/shop_repository.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  @override
  FavoritesState get initialState => InitialFavoritesState();
  ShopRepository shopRepository;

  FavoritesBloc({@required this.shopRepository});

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    if (event is LoadFavoriteProducts) {
      yield LoadingFavoritesItem();
      var favProducts = await shopRepository.getFavoritesProducts();
      yield FavoritesProductLoaded(favoritesProducts: favProducts);
    }
    if (event is NewFavoriteProduct) {
      await shopRepository.addToFavorites(productModel: event.productModel);
      var favProducts = await shopRepository.getFavoritesProducts();
      yield FavoritesProductLoaded(favoritesProducts: favProducts);
    } else if (event is RemoveFavoriteProduct) {
      await shopRepository.removeFromFavorites(
          productModel: event.productModel);
      var favProducts = await shopRepository.getFavoritesProducts();
      yield FavoritesProductLoaded(favoritesProducts: favProducts);
    }
  }
}
