import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller!);
    controller!.forward();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    controller!.forward();
    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData(primarySwatch: Colors.blue,),
        home: MyHomePage(title: 'Lesson 13', animation: animation!,)
    );
  }
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title, required this.animation}): super(key: key);
  final String title;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.title)),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            FadeTransition(
                child: ProductBox(
                    name: "Jurassic World: Fallen Kingdom",
                    image: "https://m.media-amazon.com/images/M/MV5BNzIxMjYwNDEwN15BMl5BanBnXkFtZTgwMzk5MDI3NTM@._V1_FMjpg_UX1000_.jpg"
                ),
                opacity: animation
            ),
            MyAnimatedWidget(
                child: ProductBox(
                    name: "Frozen (2013)",
                    image: "https://upload.wikimedia.org/wikipedia/vi/thumb/0/05/Frozen_%282013_film%29_poster.jpg/220px-Frozen_%282013_film%29_poster.jpg"
                ),
                animation: animation
            ),
            ProductBox(
                name: "The Hobbit: The Battle of the five armies",
                image: "https://play-lh.googleusercontent.com/6Xs12TwwgC_o7GIDMC-guvNpcYMu6237CN4aYmlxoiquV3Hc0BeIz8JGYcoQVRQ5Yu0G"
            ),
            ProductBox(
                name: "End Game",
                image: "https://play-lh.googleusercontent.com/BHOiDO1760FXoyxNw21aKTTP959PG4w-B6xcSee_T9FhDoFp-cm8-qrBMT3yDdG6Pm4Y"
            ),
            ProductBox(
                name: "The Boss Baby",
                image: "https://m.media-amazon.com/images/M/MV5BMTg5MzUxNzgxNV5BMl5BanBnXkFtZTgwMTM2NzQ3MjI@.jpg"
            ),
            ProductBox(
                name: "Fast and Furious 8",
                image: "https://upload.wikimedia.org/wikipedia/vi/2/2d/The_Fate_of_The_Furious_Theatrical_Poster.jpg"
            ),
          ],
        )
    );
  }
}
class ProductBox extends StatelessWidget {
  ProductBox({Key? key,required this.name,required this.image}) :
        super(key: key);
  final String name;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.network(image),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                  this.name, style: TextStyle(
                                  fontWeight: FontWeight.bold
                              )
                              ),
                            ],
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}
class MyAnimatedWidget extends StatelessWidget {
  MyAnimatedWidget({required this.child, required this.animation});
  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          child: Opacity(opacity: animation.value, child: child),
        ),
        child: child
    ),
  );
}