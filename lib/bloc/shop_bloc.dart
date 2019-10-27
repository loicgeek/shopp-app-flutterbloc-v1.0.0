import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shopflut_blocv1/models/product_model.dart';
import 'package:shopflut_blocv1/repositories/shop_repository.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopRepository shopRepository;

  ShopBloc({@required this.shopRepository});

  @override
  ShopState get initialState => InitialShopState();

  @override
  Stream<ShopState> mapEventToState(
    ShopEvent event,
  ) async* {
    if (event is AppStarted) {
      yield ShopProductsLoading();
      List<ProductModel> products = await this.shopRepository.getAllProducts();
      yield ShopProductsLoaded(products: products);
    }
  }
}
