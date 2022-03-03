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
      title: 'INT3120 20',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lesson 7'),
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

  final products = [
    Product(
      name: 'Jurassic World: Fallen Kingdom',
      img: 'https://m.media-amazon.com/images/M/MV5BNzIxMjYwNDEwN15BMl5BanBnXkFtZTgwMzk5MDI3NTM@._V1_FMjpg_UX1000_.jpg',
      vote: '4.1'),
    Product(
        name: 'Frozen (2013)',
        img: 'https://upload.wikimedia.org/wikipedia/vi/thumb/0/05/Frozen_%282013_film%29_poster.jpg/220px-Frozen_%282013_film%29_poster.jpg',
        vote: '4.2'),
    Product(
        name: 'The Hobbit: The Battle of the five armies',
        img: 'https://play-lh.googleusercontent.com/6Xs12TwwgC_o7GIDMC-guvNpcYMu6237CN4aYmlxoiquV3Hc0BeIz8JGYcoQVRQ5Yu0G',
        vote: '4.6'),
    Product(
        name: 'End Game',
        img: 'https://play-lh.googleusercontent.com/BHOiDO1760FXoyxNw21aKTTP959PG4w-B6xcSee_T9FhDoFp-cm8-qrBMT3yDdG6Pm4Y',
        vote: '4.8'),
    Product(
        name: "Fast and Furious 8",
        img: 'https://upload.wikimedia.org/wikipedia/vi/2/2d/The_Fate_of_The_Furious_Theatrical_Poster.jpg',
        vote: '4.0'),
    Product(
        name: "The Boss Baby",
        img: 'https://m.media-amazon.com/images/M/MV5BMTg5MzUxNzgxNV5BMl5BanBnXkFtZTgwMTM2NzQ3MjI@.jpg',
        vote: '4.7'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text("Phim đề xuất cho bạn",style: TextStyle(fontSize: 30)),
            const Padding(padding: EdgeInsets.all(20)),
            ListView.builder(shrinkWrap: true, itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                    leading: Image.network(products[index].img, width: 100, height: 100, fit: BoxFit.fitHeight),
                    title: Text(products[index].name, style: const TextStyle(fontSize: 20)),
                    subtitle: Text(products[index].vote),
              ),
              );
            },)
          ],
        )
      )
    );
  }
}

class Product {
  final String name;
  final String img;
  final String vote;
  Product({required this.name,required this.img,required this.vote});
}
