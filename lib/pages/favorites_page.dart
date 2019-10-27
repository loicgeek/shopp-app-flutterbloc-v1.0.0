import 'package:flutter/material.dart';
import 'package:shopflut_blocv1/repositories/shop_repository.dart';
import 'package:shopflut_blocv1/widgets/single_product_widget.dart';
import '../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FavoritesBloc>(context)..add(LoadFavoriteProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites Items'),
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is LoadingFavoritesItem) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FavoritesProductLoaded) {
            if (state.favoritesProducts.length == 0) {
              return Center(
                child: Text('No Favorites Item Found'),
              );
            } else {
              return ListView.builder(
                itemCount: state.favoritesProducts.length,
                itemBuilder: (context, index) {
                  return SingleProductWidget(
                    productModel: state.favoritesProducts[index],
                  );
                },
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
