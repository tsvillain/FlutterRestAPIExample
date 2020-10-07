import 'dart:convert';
import 'package:FlutterRestAPIExample/consts.dart';
import 'package:FlutterRestAPIExample/newsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///variable for storing news
  List<NewsModel> _news = List<NewsModel>();

  ///fetching news from API endpoint
  void fetchNews() async {
    try {
      ///defining headers
      // Map<String, String> header = {"Content-type": "application/json"};
      http.Response response = await http.get(Constansts.endPoint);
      var data = jsonDecode(response.body)["articles"];
      for (var i = 0; i < data.length; i++) {
        _news.add(NewsModel.fromMap(data[i]));
      }
      setState(() {});
    } catch (e) {
      print("Error:: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REST API"),
      ),
      body: ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${_news[index].title}"),
            subtitle: Text("${_news[index].description}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchNews,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
