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
            onPressed: () => {Navigator.pushNamed(context, '/animalpage')},
            child: new Text("はじめる"),
          ),
        ],
      )),
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
      body: new Stack(children: <Widget>[
        new AnimalPageView(),
        new Center(
          child: new FlatButton(
            padding: EdgeInsets.all(10.0),
            color: Colors.redAccent,
            onPressed: () => {Navigator.pop(context)},
            child: new Text("もどる"),
          ),
        ),
      ]),
    );
  }
}

class AnimalPageView extends StatefulWidget {
  @override
  _AnimalPageViewState createState() => _AnimalPageViewState();
}

class _AnimalPageViewState extends State<AnimalPageView> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        AnimalPage1Widget(),
        AnimalPage2Widget(),
        AnimalPage3Widget(),
      ],
    );
  }
}

class AnimalPage1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/animalpage1_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Image.asset('images/logo.png'),
      ]),
      );
  }
}

class AnimalPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/animalpage2_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class AnimalPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/animalpage3_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
