import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './theme.dart';
import './animationn.dart';
import './rainbow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return      MaterialApp(
            title: 'Flutter Theme Provider',
            theme: notifier.darkTheme ? dark : light,
            home: HomePage(),
          );
        } ,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Key _key;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Provider'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.favorite), //button for animation
              onPressed: () {setState(() {_key = UniqueKey();});},
            ),
            RippleAnimation(
                repeat: false,
                key: _key,
                child: Container()
            ),
            // Rainbow(),
            Rainbow(   ),
          ],
        ),
      ),
    );
  }
}
