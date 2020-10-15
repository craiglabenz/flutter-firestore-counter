import 'package:firebasecounter/counter_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DependenciesProvider extends StatelessWidget {
  final Widget child;
  DependenciesProvider({@required this.child});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ICounterManager>(
            create: (context) => FirestoreCounterManager()),
      ],
      child: child,
    );
  }
}

class TestDependenciesProvider extends StatelessWidget {
  final Widget child;
  TestDependenciesProvider({@required this.child});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ICounterManager>(
          create: (context) => CounterManager(),
        ),
      ],
      child: child,
    );
  }
}
