import 'dart:math';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Ask Me Everything'),
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
  int activeIndex = 0;
  dynamic listImagesnotFound = [
    "assets/images/ball1.png",
    "assets/images/ball2.png",
    "assets/images/ball3.png",
    "assets/images/ball4.png",
    "assets/images/ball5.png"
  ];
  late Random rnd;

  void _randomImage() {
    int min = 0;
    int max = listImagesnotFound.length-1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    setState(() {
      activeIndex = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _randomImage, // handle your image tap here
              child: Image.asset(
                listImagesnotFound[activeIndex],
                fit: BoxFit.cover, // this is the solution for border
              ),
            )
          ],
        ),
      ),
    );
  }
}
