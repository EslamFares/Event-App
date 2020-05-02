import 'package:event_app_ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/img/background.png',
                fit: BoxFit.cover,
              )),
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 50,
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/img/logo.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'UVE',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'NTO',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xffffa700),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                    'There’s a lot happening around you! Our mission is to provide what’s happening near you!"',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        height: 1.7,
                        letterSpacing: 1.2)),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>HomeScreen()
                    ));
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Get Started',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 5,),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
