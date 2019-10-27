import 'package:flutter/material.dart';
import 'package:shopflut_blocv1/bloc/bloc.dart';
import 'package:shopflut_blocv1/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProductWidget extends StatefulWidget {
  final ProductModel productModel;
  SingleProductWidget({Key key, this.productModel}) : super(key: key);

  @override
  _SingleProductWidgetState createState() => _SingleProductWidgetState();
}

class _SingleProductWidgetState extends State<SingleProductWidget> {
  SingleproductBloc singleproductBloc;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    if (singleproductBloc != null) {
      singleproductBloc.close();
    }
  }

  @override
  void initState() {
    singleproductBloc = SingleproductBloc(
        productModel: widget.productModel,
        favoritesBloc: BlocProvider.of<FavoritesBloc>(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StreamBuilder<Object>(
            stream: singleproductBloc.isInFavorite.stream,
            builder: (context, snapshot) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.amber,
                      width: MediaQuery.of(context).size.width * .45,
                      child: Center(child: Text(widget.productModel.name)),
                    ),
                    snapshot.data == true
                        ? unLikeButton(singleproductBloc)
                        : likeButton(singleproductBloc),
                    StreamBuilder(
                      stream: singleproductBloc.isProcessing.stream,
                      builder: (ctx, sshot) {
                        return sshot.data == true
                            ? Container(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(),
                              )
                            : Container();
                      },
                    )
                  ],
                ),
              );
            })
      ],
    );
  }

  Widget likeButton(SingleproductBloc singleproductBloc) {
    return IconButton(
      icon: Icon(Icons.favorite_border),
      onPressed: () {
        singleproductBloc.addToFavorite();
      },
    );
  }

  Widget unLikeButton(SingleproductBloc singleproductBloc) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      onPressed: () {
        singleproductBloc.removeFromFavorites();
      },
    );
  }
}
