import 'package:flutter/foundation.dart';
import 'package:tasks_to_do/blocs/bloc_exports.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print(change);
    }
  }

  @override
  void onClose(BlocBase bloc) {}

  @override
  void onCreate(BlocBase bloc) {}

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(error);
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    if (kDebugMode) {
      print("${bloc.runtimeType} - $event");
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      print(transition);
    }
  }
}
