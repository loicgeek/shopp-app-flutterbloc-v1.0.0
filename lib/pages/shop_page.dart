import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopflut_blocv1/pages/favorites_page.dart';
import 'package:shopflut_blocv1/widgets/single_product_widget.dart';
import '../bloc/bloc.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<FavoritesBloc>(context),
                  child: FavoritePage(),
                );
              }));
            },
            child: Row(
              children: <Widget>[
                Text('Favorites'),
              ],
            ),
          )
        ],
      ),
      body: BlocListener<FavoritesBloc, FavoritesState>(
        listener: (context, state) {
          print(state);
          if (state is FavoritesProductLoaded) {
            final snackBar = SnackBar(
              content: Text('Product Favorites'),
              duration: Duration(seconds: 1),
            );
            // Find the Scaffold in the widget tree and use it to show a SnackBar.
            //Scaffold.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<ShopBloc, ShopState>(
          builder: (context, state) {
            if (state is ShopProductsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ShopProductsLoaded) {
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return SingleProductWidget(
                          productModel: state.products[index]);
                    },
                  ),
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
