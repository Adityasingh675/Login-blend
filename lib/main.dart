import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _iconAnimation = CurvedAnimation(
        parent: _iconController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => setState(() {}));
    _iconController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage("assets/image-analysis.png"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40.0),
                          ),
                          MaterialButton(
                            height: 40.0,
                            minWidth: 100.0,
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: Text("Login"),
                            onPressed: () {},
                            splashColor: Colors.blueGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
