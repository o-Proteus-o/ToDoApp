import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObsever implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("onChange: $change");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("onClosed: $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("onCreate: $bloc");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("onError: $error");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("onError: $transition");
  }
}
