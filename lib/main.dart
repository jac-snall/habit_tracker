import 'package:flutter/material.dart';
import 'Views/start_view.dart';
import 'Views/home_view.dart';
import 'Views/calender_view.dart';
import 'Views/info_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('AppData');

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF8359FB),
        scaffoldBackgroundColor: const Color(0xFF8359FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8359FB),
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white, fontSize: 36),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF5C3EB0),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 24),
            minimumSize: const Size(158, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: _getStartScreen(),
      routes: {
        '/home': (context) => const HomeView(),
        '/calender': (context) => const CalenderView(),
        '/info': (context) => const InfoView(),
      },
    );
  }

  Widget _getStartScreen() {
    var box = Hive.box('AppData');
    if (box.get('Habit') != null) {
      return const HomeView();
    }
    return const StartView();
  }
}
