import 'package:equatable/equatable.dart';

abstract class SingleproductEvent extends Equatable {
  const SingleproductEvent();
}

class AddedToFavorite extends SingleproductEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RemovedFromFavorite extends SingleproductEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
