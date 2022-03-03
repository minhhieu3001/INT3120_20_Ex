import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INT3120 20',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lesson 11'),
      debugShowCheckedModeBanner: false,
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
  final list = [
    {
      'name': 'Jurassic World: Fallen Kingdom',
      'img': 'https://m.media-amazon.com/images/M/MV5BNzIxMjYwNDEwN15BMl5BanBnXkFtZTgwMzk5MDI3NTM@._V1_FMjpg_UX1000_.jpg',
    },
    {
      'name': 'Frozen (2013)',
      'img': 'https://upload.wikimedia.org/wikipedia/vi/thumb/0/05/Frozen_%282013_film%29_poster.jpg/220px-Frozen_%282013_film%29_poster.jpg',
    },
    {
      'name': 'The Hobbit: The Battle of the five armies',
      'img': 'https://play-lh.googleusercontent.com/6Xs12TwwgC_o7GIDMC-guvNpcYMu6237CN4aYmlxoiquV3Hc0BeIz8JGYcoQVRQ5Yu0G',
    },
    {
      'name': 'End Game',
      'img': 'https://play-lh.googleusercontent.com/BHOiDO1760FXoyxNw21aKTTP959PG4w-B6xcSee_T9FhDoFp-cm8-qrBMT3yDdG6Pm4Y',
    },
    {
      'name': "The Boss Baby",
      'img': 'https://m.media-amazon.com/images/M/MV5BMTg5MzUxNzgxNV5BMl5BanBnXkFtZTgwMTM2NzQ3MjI@.jpg',
    },
    {
      'name': "Fast and Furious 8",
      'img': 'https://khophimhay.net/wp-content/uploads/2021/03/Furious-8-Poster.jpg',
    },
    {
      'name': "Spiderman : No way home",
      'img': 'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/s/n/snwh_poster_bluemontage_4x5fb_1_.jpg',
    },
    {
      'name': "Harry Potter and The Goblet fire",
      'img': 'https://i.ytimg.com/vi/_JLwfq2WBO0/movieposter_en.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return ItemBox(
              item: Item(item['name']!, item['img']!, 0),
            );
          },
        ),
      ),
    );
  }
}

class ItemBox extends StatelessWidget {
  const ItemBox({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: item,
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: NetworkImage(item.img)),
              ),
            ),
            title: Text(item.name),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 80),
              child: ScopedModelDescendant<Item>(builder: (context, child, model) {
                return RatingBox(item: model);
              })),
        ],
      ),
    );
  }
}

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [1, 2, 3, 4, 5]
          .map(
            (i) => IconButton(
          onPressed: () {
            item.setRating(i);
          },
          icon: item.rating >= i
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border),
          color: Colors.red[200],
        ),
      )
          .toList(),
    );
  }
}

class Item extends Model {
  final String name;
  final String img;
  int rating;

  Item(this.name, this.img, this.rating);

  factory Item.fromMap(Map<String, dynamic> json) {
    return Item(json['name'], json['img'], 0);
  }

  void setRating(newRating) {
    rating = newRating;
    notifyListeners();
  }
}