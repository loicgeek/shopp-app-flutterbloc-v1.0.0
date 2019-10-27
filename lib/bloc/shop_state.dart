import 'package:meta/meta.dart';
import 'package:shopflut_blocv1/models/product_model.dart';

@immutable
abstract class ShopState {}

class InitialShopState extends ShopState {}

class ShopProductsLoading extends ShopState {}

class ShopProductsLoaded extends ShopState {
  final List<ProductModel> products;
  ShopProductsLoaded({@required this.products});
}
