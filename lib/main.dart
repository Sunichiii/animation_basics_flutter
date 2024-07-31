import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(fontFamily: 'Protest'),
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int totalPage = 4;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(() {
      setState(() {}); 
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: 'assets/images/blue.jpg',
            title: 'Blue Bell',
            description: 'Blue flowers symbolize serenity, tranquility, and inspiration, often evoking a sense of calm and the mystery of the unknown.',
          ),
          makePage(
            page: 2,
            image: 'assets/images/purple.jpg',
            title: 'Lavender',
            description: 'Purple flowers signify luxury, creativity, and admiration, conveying a sense of elegance and deep emotional connection, often linked to royalty.',
          ),
          makePage(
            page: 3,
            image: 'assets/images/white.jpg',
            title: 'Lily',
            description: 'White flowers symbolize purity, innocence, and new beginnings, often associated with simplicity, elegance, and peace in various cultural contexts.',
          ),
          makePage(
            page: 4,
            image: 'assets/images/Yellow.jpg',
            title: 'Daffodil',
            description: 'Yellow flowers represent happiness, joy, and friendship, radiating warmth and cheerfulness, often associated with sunshine and positive energy.',
          ),
        ],
      ),
    );
  }

  Widget makePage({required int page, required String image, required String title, required String description}) {
    int currentPage = (_pageController.hasClients) ? (_pageController.page! + 1).toInt() : 1;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    '$currentPage',
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '/$totalPage',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.grey, size: 15),
                        ),
                        Text('4.0', style: TextStyle(color: Colors.white70)),
                        Text('(2987)', style: TextStyle(color: Colors.white38, fontSize: 12)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        description,
                        style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.9, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'READ MORE....',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
