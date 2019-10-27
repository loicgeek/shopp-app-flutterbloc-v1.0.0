import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AppinitialisationBloc
    extends Bloc<AppinitialisationEvent, AppinitialisationState> {
  @override
  AppinitialisationState get initialState => InitialAppinitialisationState();

  @override
  Stream<AppinitialisationState> mapEventToState(
    AppinitialisationEvent event,
  ) async* {
    if (event is AppProgress) {
      yield Initialising(progress: event.progress);
      if (event.progress == 100) {
        yield InitialisationComplete();
      }
    }
    if (event is AppLaunched) {
      Timer timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        this.add(AppProgress(progress: timer.tick ~/ 5));
        if (timer.tick == 500) {
          timer.cancel();
        }
      });
    }
  }

  @override
  void onEvent(AppinitialisationEvent event) {
    // TODO: implement onEvent
    super.onEvent(event);
    print(event);
  }
}
