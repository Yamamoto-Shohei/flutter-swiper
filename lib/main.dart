import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  List<Color> pageColors = [
    Colors.yellow,
    Colors.blue,
    Colors.brown,
    Colors.orange,
    Colors.teal,
    Colors.red,
    Colors.white
  ];

  Widget pageWidget(index) => Container(
      color: pageColors.elementAt(index),
      width: Size.infinite.width,
      height: Size.infinite.height,
      alignment: Alignment.center,
      child: Text('${index + 1} page',
          style: Theme.of(context).textTheme.headline1!.copyWith(
              color: pageColors.elementAt(index).computeLuminance() < 0.5
                  ? Colors.white
                  : Colors.black)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemBuilder: (context, index) => pageWidget(index),
        itemCount: pageColors.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
