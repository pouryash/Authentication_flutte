import 'package:flutter/material.dart';
import 'package:flutter_note/Utils/ScreenUtils.dart';
import 'package:flutter_note/values/Colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: mainDark,
        accentColor: mainColor,
        fontFamily: 'iranSans',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'iranSans'),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: "Home",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      appBar: PreferredSize(
        child: Container(
          height: double.infinity,
          color: mainColor,
          padding: EdgeInsets.only(left: 8, top: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  icon: AnimatedIcon(
                   icon: AnimatedIcons.menu_close,
                    color: white,
                    progress: _animationController,
                  ),
                  onPressed: () {
                    widget._scaffoldKey.currentState.openDrawer();
                    _handleMenuOnPressed();
                  }),
              Text(
                widget.title,
                style: TextStyle(
                    color: white,
                    fontSize: 24,
                    fontFamily: "iranSans",
                    fontWeight: FontWeight.w600),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Material(
                  color: mainColor,
                  child: InkWell(
                    splashColor: Colors.white.withOpacity(0.3),
                    highlightColor: Colors.white.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.more_vert,
                        color: white,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
        ),
        preferredSize: Size(displayWidth(context), 60),
      ),
      drawer: SafeArea(
        top: true,
        child: Drawer(
          elevation: 20,
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              DrawerHeader(
                child: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  textColor: Colors.white,
                ),
                decoration: BoxDecoration(color: mainDark),
              ),
              CustomeListTile(
                title: "profile",
                icon: Icons.person,
              ),
              CustomeListTile(
                title: "setting",
                icon: Icons.settings,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: displayHeight(context) - 60,
      ),
    );
  }
  void _handleMenuOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}

class CustomeListTile extends StatelessWidget {
  IconData icon;
  String title;

  CustomeListTile({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(
        icon,
        color: black,
      ),
      onTap: () {},
      trailing: Icon(
        Icons.arrow_right,
        color: black,
      ),
    );
  }
}
