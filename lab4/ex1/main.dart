import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './theme.dart';
import './data.dart';

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

class HomePage extends StatelessWidget {
  late Future<Data> futureAlbum;

  HomePage() {
    futureAlbum = fetchNetworkData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Provider'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => SwitchListTile(
                title: Text("Light / Dark Mode"),
                onChanged: (val){
                  notifier.toggleTheme();
                },
                value: notifier.darkTheme ,
              ),
            ),

            Center(
              child: FutureBuilder<Data>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.title);
                  } else {
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: (){},
      ),
    );
  }
}
