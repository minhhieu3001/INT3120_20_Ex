import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Product {
  final String name;
  final String img;
  final String description;

  Product(this.name, this.img, this.description);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(Product("The Boss Baby", "https://m.media-amazon.com/images/M/MV5BMTg5MzUxNzgxNV5BMl5BanBnXkFtZTgwMTM2NzQ3MjI@.jpg", "là phim hoạt hình"));
    // items = [
    //   Product(
    //     'Jurassic World: Fallen Kingdom',
    //     'https://m.media-amazon.com/images/M/MV5BNzIxMjYwNDEwN15BMl5BanBnXkFtZTgwMzk5MDI3NTM@._V1_FMjpg_UX1000_.jpg',
    //     'Là phim nói về khủng long'
    //   ),
    //   Product(
    //     'Frozen (2013)',
    //     'https://upload.wikimedia.org/wikipedia/vi/thumb/0/05/Frozen_%282013_film%29_poster.jpg/220px-Frozen_%282013_film%29_poster.jpg',
    //     "Là phim về nữ hoàng băng giá"
    //   ),
    //   Product(
    //     'The Hobbit: The Battle of the five armies',
    //     'https://play-lh.googleusercontent.com/6Xs12TwwgC_o7GIDMC-guvNpcYMu6237CN4aYmlxoiquV3Hc0BeIz8JGYcoQVRQ5Yu0G',
    //     "Thuộc phim người lùn"
    //   ),
    //   Product(
    //     'End Game',
    //     'https://play-lh.googleusercontent.com/BHOiDO1760FXoyxNw21aKTTP959PG4w-B6xcSee_T9FhDoFp-cm8-qrBMT3yDdG6Pm4Y',
    //     'phim của marvel'
    //   ),
    //   Product(
    //     "The Boss Baby",
    //     'https://m.media-amazon.com/images/M/MV5BMTg5MzUxNzgxNV5BMl5BanBnXkFtZTgwMTM2NzQ3MjI@.jpg',
    //     'phim hoạt hình '
    //   ),
    // ];
    return items;
  }

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INT3120 20 ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lesson 12'),
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

  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text("Phim đề xuất cho bạn"),
          ListView.builder(itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ProductBox(item: items[index]),
                    onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(item: items[index]),
                    ),);
                    },
                );
              })
        ],
      )
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phim đề xuất"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(item.img, height: 100, width: 100,),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                        Text(item.description, style: const TextStyle(fontSize: 20)),
                        RatingBox(),
                      ],
                    ),
                  )
              )
            ],
          )
        ),
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int rating =0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [1,2,3,4,5].map((i) => IconButton(onPressed: () {
        setState(() {
          rating = i;
        });
      }, icon: rating >= i ? const Icon(Icons.star) : const Icon(Icons.star_border), color: Colors.red[250]),
      ).toList(),
    );
  }
}

class ProductBox extends StatelessWidget{
  const ProductBox({Key? key, required this.item}) : super(key: key);
  final Product item;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5), height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(this.item.img),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    RatingBox(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


