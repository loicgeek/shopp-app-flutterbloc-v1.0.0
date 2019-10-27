import 'package:meta/meta.dart';

@immutable
abstract class AppinitialisationState {}

class InitialAppinitialisationState extends AppinitialisationState {}

class Initialising extends AppinitialisationState {
  final int progress;
  Initialising({this.progress});
}

class InitialisationComplete extends AppinitialisationState {}
