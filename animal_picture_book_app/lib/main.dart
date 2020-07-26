import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/animalpage': (context) => AnimalPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo.png'),
            FlatButton(
              padding: EdgeInsets.all(10.0),
              color: Colors.redAccent,
              onPressed: () => {
                Navigator.pushNamed(context, '/animalpage')},
              child: new Text("はじめる"),
            ),
          ],
        )
      ),
    );
  }
}


class AnimalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('animal'),
      ),
      body: new Center(
        child: new FlatButton(
          padding: EdgeInsets.all(10.0),
          color: Colors.redAccent,
          onPressed: () => {
              Navigator.pop(context)},
          child: new Text("もどる"),
        ),
      )
    );
  }
}