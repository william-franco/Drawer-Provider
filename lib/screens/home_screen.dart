import 'package:drawer_provider/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:drawer_provider/providers/counter_provider.dart';
import 'package:drawer_provider/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final String title = 'Drawer Provider';

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: appBarHome(context, title),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              Text(
                '${counter.count}',
                key: Key('counterState'),
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('increment_floatingActionButton'),
        onPressed: () => counter.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
