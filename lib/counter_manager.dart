import 'package:firebasecounter/app_state.dart';

/// Interface that defines the functions required to manipulate
/// the app state.
///
/// Defined as an abstract class so that tests can operate on a
/// version that does not communicate with Firebase.
abstract class ICounterManager {
  /// Any `CounterManager` must have an instance of the state
  /// object.
  AppState state;

  /// Handler for when a new click must be stored. Does not require
  /// any parameters, because it only causes the timestamp to
  /// persist.
  void increment();
}

class CounterManager implements ICounterManager {
  AppState state = AppState();
  void increment() => state = state.copyWith(DateTime.now());
}
