import 'package:flutter/material.dart';
import 'package:untitled4/ApiService/api_service.dart';
import 'package:untitled4/models/post_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Post> posts = [];

  void _apiGetUsers(){
    ApiService.GET(ApiService.USER, ApiService.paramsEmpty()).then((value) => {
      setState((){
        posts = value!;
      })
    });
  }

  void _apiGetOneUser(){
    ApiService.GET("${ApiService.USER}/1", ApiService.paramsEmpty()).then((value) => {
      print(value)
    });
  }

  @override
  void initState() {
    _apiGetUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(posts[index].title,style: const TextStyle(),maxLines: 1,),
              leading: const Icon(Icons.account_circle),
            );
        },)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
