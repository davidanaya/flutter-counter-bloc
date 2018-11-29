import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class EvenCounterBloc {
  final _counter$ = BehaviorSubject<int>(seedValue: 0);
  final _incrementController = StreamController<int>();

  EvenCounterBloc() {
    _incrementController.stream.listen((int value) => _counter$.add(value * 2));
  }

  Sink<int> get increment => _incrementController.sink;

  Stream<int> get counter$ => _counter$.stream;

  void dispose() {
    _incrementController.close();
    _counter$.close();
  }
}
