import 'package:meta/meta.dart';

@immutable
abstract class ShopEvent {}

class AppStarted extends ShopEvent {}
