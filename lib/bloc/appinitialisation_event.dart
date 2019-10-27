import 'package:meta/meta.dart';

@immutable
abstract class AppinitialisationEvent {}

class AppLaunched extends AppinitialisationEvent {}

class AppProgress extends AppinitialisationEvent {
  final int progress;
  AppProgress({this.progress});

  @override
  String toString() {
    // TODO: implement toString
    return '$progress';
  }
}
