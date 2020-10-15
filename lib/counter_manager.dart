import 'package:cloud_firestore/cloud_firestore.dart';
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

class FirestoreCounterManager implements ICounterManager {
  AppState state;
  final FirebaseFirestore _firestore;
  FirestoreCounterManager()
      : _firestore = FirebaseFirestore.instance,
        state = const AppState() {
    _watchCollection();
  }
  void _watchCollection() {
    // Part 1
    _firestore.collection('clicks').snapshots()
        // Part 2
        .listen((QuerySnapshot snapshot) {
      // Part 3
      if (snapshot.docs.isEmpty) return;
      // Part 4
      final _clicks = snapshot.docs
          .map<DateTime>((doc) {
            final timestamp = doc.data()['timestamp'];
            return (timestamp != null)
                ? (timestamp as Timestamp).toDate()
                : null;
          })
          // Part 5
          .where((val) => val != null)
          // Part 6
          .toList();
      // Part 7
      state = AppState(_clicks);
    });
  }

  @override
  void increment() {
    _firestore.collection('clicks').add({
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
