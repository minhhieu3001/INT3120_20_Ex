import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Lesson 8" ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void showAlert(BuildContext context) {
    showDialog(
        context: context, builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Message"),
        content: new Text("one tap"),
        actions: <Widget>[
          new FlatButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: new Text("Close")),
        ],
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            showAlert(context);
          },
          child: Image.network('https://is2-ssl.mzstatic.com/image/thumb/Purple123/v4/4a/ac/30/4aac303d-ba2e-d44c-602a-20120719cd8c/AppIcon-0-0-1x_U007emarketing-0-0-0-9-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x630wa.png'),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
