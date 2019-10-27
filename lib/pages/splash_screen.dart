import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopflut_blocv1/pages/shop_page.dart';
import 'package:shopflut_blocv1/repositories/shop_repository.dart';
import '../bloc/bloc.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppinitialisationBloc, AppinitialisationState>(
          listener: (context, state) {
        print(state);
        if (state is InitialisationComplete) {
          ShopRepository shopRepository = ShopRepository();
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<ShopBloc>(
                  builder: (context) => ShopBloc(shopRepository: shopRepository)
                    ..add(AppStarted()),
                ),
                BlocProvider<FavoritesBloc>(
                  builder: (context) =>
                      FavoritesBloc(shopRepository: shopRepository),
                ),
              ],
              child: ShopPage(),
            );
          }));
          // Find the Scaffold in the widget tree and use it to show a SnackBar.
          //Scaffold.of(context).showSnackBar(snackBar);
        }
      }, child: BlocBuilder<AppinitialisationBloc, AppinitialisationState>(
        builder: (context, state) {
          if (state is Initialising) {
            return Center(
              child: Container(
                height: 20,
                width: MediaQuery.of(context).size.width * 0.9,
                child: LiquidLinearProgressIndicator(
                  value: state.progress / 100,
                  direction: Axis.horizontal,
                  center: Text('${state.progress} %'),
                ),
              ),
            );
          }
          return Container();
        },
      )),
    );
  }
}
