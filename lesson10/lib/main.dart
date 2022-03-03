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
      home: const MyHomePage(title: 'Lesson 10'),
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
        ),
    Product(
        name: 'Frozen (2013)',
        img: 'https://upload.wikimedia.org/wikipedia/vi/thumb/0/05/Frozen_%282013_film%29_poster.jpg/220px-Frozen_%282013_film%29_poster.jpg',
        ),
    Product(
        name: 'The Hobbit: The Battle of the five armies',
        img: 'https://play-lh.googleusercontent.com/6Xs12TwwgC_o7GIDMC-guvNpcYMu6237CN4aYmlxoiquV3Hc0BeIz8JGYcoQVRQ5Yu0G',
        ),
    Product(
        name: 'End Game',
        img: 'https://play-lh.googleusercontent.com/BHOiDO1760FXoyxNw21aKTTP959PG4w-B6xcSee_T9FhDoFp-cm8-qrBMT3yDdG6Pm4Y',
        ),
    Product(
        name: "The Boss Baby",
        img: 'https://m.media-amazon.com/images/M/MV5BMTg5MzUxNzgxNV5BMl5BanBnXkFtZTgwMTM2NzQ3MjI@.jpg',
        ),
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
                    return Column(
                      children: [ 
                        ListTile(
                          leading: Image.network(products[index].img, width: 100, height: 100, fit: BoxFit.fitHeight),
                          title: Text(products[index].name, style: const TextStyle(fontSize: 20)),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 100), child: RatingBox(),)
                      ]
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
  Product({required this.name,required this.img});
}

class RatingBox extends StatefulWidget {
  const RatingBox({Key? key}) : super( key: key);

  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int vote =0 ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [1,2,3,4,5].map((i) => IconButton(onPressed: () {
        setState(() {
          vote = i;
        });
      }, icon: vote >= i ? const Icon(Icons.star) : const Icon(Icons.star_border), color: Colors.red[200]),).toList(),
    );
  }
}
