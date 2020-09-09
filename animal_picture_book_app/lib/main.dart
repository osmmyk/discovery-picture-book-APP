import 'package:flutter/material.dart';
import 'package:infinity_page_view/infinity_page_view.dart';

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

//スタート画面
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('start'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/logo.png'),
              FlatButton(
                padding: EdgeInsets.all(10.0),
                shape: StadiumBorder(),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () => {Navigator.pushNamed(context, '/animalpage')},
                child: new Text("はじめる"),
              ),
            ],
          )),
    );
  }
}

//Animal　包括
class AnimalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(children: <Widget>[
        new AnimalPageView(),
        Positioned(
          left: 10.0,
          top: 20.0,
          child: new FlatButton(
            padding: EdgeInsets.all(10.0),
            shape: StadiumBorder(),
            color: Colors.white,
            onPressed: () => {Navigator.pop(context)},
            child: new Text("もどる"),
          ),
        ),
      ]),
    );
  }
}

//Animal　スクロール
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

//Animal　1ページ目
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
        Positioned(
          left: 20.0,
          bottom: 80.0,
          //画像タップ
          child: GestureDetector(
            onTap: () {
            // タップでダイアログを表示
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0))),
                    title: Center(child: Text("らいおん"),),
                    content: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Image.asset('images/animalpage1_item1.png'),
                          Padding(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              child: Text("がおがおがおがおがおがおがおがおがおがおがおがお〜〜〜"),
                          ),
                          FlatButton(
                            child: Text("とじる"),
                            shape: StadiumBorder(),
                            color: Colors.black12,
                            onPressed: () => Navigator.pop(context),
                          ),
                          ]),
                      ),
                  ),
              );
            },
            child: Image.asset('images/animalpage1_item1.png'),
          ),
          ),
        ]),
      );
  }
}

//Animal　2ページ目
class AnimalPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/animalpage2_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 60.0,
          top: 80.0,
          child: Image.asset('images/animalpage2_item1.png'),
        ),
      ]),
    );
  }
}

//Animal　3ページ目
class AnimalPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/animalpage3_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 20.0,
          top: 250.0,
          child: Image.asset('images/animalpage3_item1.png'),
        ),
      ]),
    );
  }
}