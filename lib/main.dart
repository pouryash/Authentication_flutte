import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note/Utils/ScreenUtils.dart';
import 'package:flutter_note/customWidget/CustomLoginButton.dart';
import 'package:flutter_note/customWidget/TextFiledCustom.dart';
import 'package:flutter_note/values/Colors.dart';
import 'package:flutter/services.dart';

import 'Home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
    //     .then((value) => runApp(MyApp()));
    return MaterialApp(
      routes: {
        '/home': (context) => Home(),
      },
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
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isLogin = true;
  String header = "Login";
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: displayHeight(context) * 0.30,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20))),
                child: Text(
                  header,
                  style: TextStyle(
                      color: white, fontSize: 30, fontFamily: "iranSans"),
                ),
              ),
              Container(
                height: displayHeight(context) * 0.70,
                padding: EdgeInsets.only(bottom: 20),
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFiledCustom(
                      label: "User Name",
                      hint: "Enter User Name",
                      prefixIcon: Icons.person_outline,
                      isObscure: false,
                      controller: nameController,
                    ),
                    Visibility(
                      visible: !isLogin,
                      child: TextFiledCustom(
                        label: "Email",
                        hint: "Enter User Email",
                        prefixIcon: Icons.email_outlined,
                        isObscure: false,
                        controller: emailController,
                      ),
                    ),
                    TextFiledCustom(
                      label: "Password",
                      hint: "Enter User Password",
                      prefixIcon: Icons.lock,
                      isObscure: true,
                      suffixIcon: Icons.visibility_off,
                      isLastOne: true,
                      controller: passwordController,
                    ),
                    Container(
                      width: displayWidth(context),
                      padding: EdgeInsets.only(top: 4, right: 2),
                      child: Text(
                        "Forget Password",
                        style:
                            TextStyle(fontFamily: "iranSans", color: mainColor),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: CustomLoginButton(
                        name: isLogin ? "Login" : "Sign Up",
                        hasBorder: false,
                        onButtonTap: () {
                          if(isLogin){
                            if(nameController.text == "pourya" && passwordController.text == "1234")
                              Navigator.pushReplacementNamed(context, "/home");
                          }
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: CustomLoginButton(
                          name: isLogin ? "Sign Up" : "Login",
                          hasBorder: true,
                          onButtonTap: () {
                            setState(() {
                              if(header == "Login"){
                                isLogin = false;
                                header = "Sign Up";
                              }else{
                                isLogin = true;
                                header = "Login";
                              }
                            });
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
