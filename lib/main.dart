import 'package:firebasecounter/dependencies.dart';
import 'package:firebasecounter/counter_manager.dart';
import 'package:firebasecounter/firebase_waiter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DependenciesProvider(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirebaseWaiter(
        builder: (context) => Consumer<ICounterManager>(
          builder: (context, manager, _child) => MyHomePage(
            manager: manager,
            title: 'Flutter Demo Home Page',
          ),
        ),
        // This is a great place to put your splash page!
        waitingChild: Scaffold(
          body: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final ICounterManager manager;
  MyHomePage({@required this.manager, Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // No longer expect to receive a `ICounterManager object`
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              // Reference `widget.manager` instead of
              // `manager` directly
              '${widget.manager.state.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Reference `widget.manager` instead of `manager` directly
        onPressed: () => setState(() => widget.manager.increment()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
