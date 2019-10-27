import 'package:equatable/equatable.dart';

abstract class SingleproductState extends Equatable {
  const SingleproductState();
}

class InitialSingleproductState extends SingleproductState {
  @override
  List<Object> get props => [];
}

class InFavorite extends SingleproductState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NotInFavorite extends SingleproductState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
