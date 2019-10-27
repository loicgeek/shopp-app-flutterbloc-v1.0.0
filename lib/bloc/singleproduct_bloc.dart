import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shopflut_blocv1/models/product_model.dart';
import 'package:shopflut_blocv1/repositories/shop_repository.dart';
import './bloc.dart';
import 'package:rxdart/rxdart.dart';

class SingleproductBloc extends Bloc<SingleproductEvent, SingleproductState> {
  FavoritesBloc favoritesBloc;
  final ProductModel productModel;
  BehaviorSubject<bool> isInFavorite = new BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isProcessing = new BehaviorSubject<bool>.seeded(false);

  SingleproductBloc({this.productModel, this.favoritesBloc}) {
    print(productModel);
    favoritesBloc.listen((state) {
      var isIn = false;
      if (state is FavoritesProductLoaded) {
        state.favoritesProducts.forEach((p) {
          if (p.id == productModel.id) {
            isIn = true;
          }
        });

        if (isIn) if (isInFavorite.value == false) {
          isInFavorite.add(true);
          isProcessing.add(false);
        }
        if (!isIn) if (isInFavorite.value == true) {
          isInFavorite.add(false);
          isProcessing.add(false);
        }
      }
    });
  }

  addToFavorite() {
    isProcessing.add(true);
    favoritesBloc.add(NewFavoriteProduct(productModel: this.productModel));
  }

  removeFromFavorites() {
    isProcessing.add(true);
    favoritesBloc.add(RemoveFavoriteProduct(productModel: this.productModel));
  }

  @override
  SingleproductState get initialState => InitialSingleproductState();

  @override
  Stream<SingleproductState> mapEventToState(
    SingleproductEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
