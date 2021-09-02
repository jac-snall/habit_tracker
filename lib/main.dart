import 'package:flutter/material.dart';
import 'Views/start_view.dart';
import 'Views/home_view.dart';
import 'Views/calender_view.dart';
import 'Views/info_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF8359FB),
        scaffoldBackgroundColor: Color(0xFF8359FB),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white, fontSize: 36),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF5C3EB0),
            primary: Colors.white,
            textStyle: TextStyle(fontSize: 24),
            minimumSize: Size(158, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      routes: {
        '/': (context) => StartView(),
        '/home': (context) => HomeView(),
        '/calender': (context) => CalenderView(),
        '/info': (context) => InfoView(),
      },
    );
  }
}
