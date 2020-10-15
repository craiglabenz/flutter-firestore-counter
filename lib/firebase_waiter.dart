import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseWaiter extends StatefulWidget {
  final Widget Function(BuildContext) builder;
  final Widget waitingChild;
  const FirebaseWaiter({
    @required this.builder,
    this.waitingChild,
    Key key,
  }) : super(key: key);
  @override
  _FirebaseWaiterState createState() => _FirebaseWaiterState();
}

class _FirebaseWaiterState extends State<FirebaseWaiter> {
  Future<FirebaseApp> firebaseReady;
  @override
  void initState() {
    super.initState();
    firebaseReady = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<FirebaseApp>(
        future: firebaseReady,
        builder: (context, snapshot) => //
            snapshot.connectionState == ConnectionState.done
                ? widget.builder(context)
                : widget.waitingChild,
      );
}
