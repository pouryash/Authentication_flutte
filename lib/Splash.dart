import 'package:flutter/material.dart';
import 'package:flutter_note/Home.dart';
import 'package:flutter_note/main.dart';
import 'values/Colors.dart';

void main() {
  runApp(Splsh());
}

class Splsh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => MyApp(),
      },
      debugShowCheckedModeBanner: false,
      title: 'splash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: "Splash",),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 4000), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic);
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: mainColor,
      child: ScaleTransition(scale: _animation,
          child: Icon(Icons.auto_awesome, size: 150, color: white,)),
    );
  }

}