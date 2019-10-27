import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopflut_blocv1/pages/shop_page.dart';
import 'package:shopflut_blocv1/repositories/shop_repository.dart';
import 'bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ShopRepository shopRepository = ShopRepository();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<ShopBloc>(
              builder: (context) =>
                  ShopBloc(shopRepository: shopRepository)..add(AppStarted()),
            ),
            BlocProvider<FavoritesBloc>(
              builder: (context) =>
                  FavoritesBloc(shopRepository: shopRepository),
            ),
          ],
          child: ShopPage(),
        ));
  }
}
