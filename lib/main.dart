import 'package:flutter/material.dart';
import 'package:training_app/model/news_model.dart';
import 'package:training_app/service/news_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final name;

  MyApp({this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treino',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  Future<NewsModel> newsModel;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  _refresh() async {
    setState(() {
      newsModel = getNews();
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      print(widget.title);
    });
  }

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 500,
                decoration: BoxDecoration(),
                child: FutureBuilder(
                    future: newsModel,
                    builder: (BuildContext context,
                        AsyncSnapshot<NewsModel> snapshot) {
                      if (snapshot.hasData) {
                        return list(snapshot.data.articles);
                      }

                      if (snapshot.hasError) {
                        return Container(
                          child: Text("Ocorreu um erro"),
                        );
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _refresh();
        },
        tooltip: 'Increment',
        child: Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget list(List<Article> list) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        Article article = list[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  //color: Color(0xffbcbcbc),
                  ),
              child: Column(
                children: [
                  Text("${article.title}", style: TextStyle(color: Colors.red)),
                  SizedBox(height: 20),
                  Container(
                    child: Text("${article.content}"),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
