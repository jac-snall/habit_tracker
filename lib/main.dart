import 'package:flutter/material.dart';
import 'Views/start_view.dart';

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
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: StartView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _complete = false;

  void _completeTask() {
    setState(() {
      _complete = true;
    });
  }

  Widget _buildCenter() {
    if (_complete) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Well done!'),
          Icon(Icons.check),
          Text('Current streak: 10'),
          Text('Longest streak: 25'),
        ],
      );
    } else {
      return IconButton(
        onPressed: _completeTask,
        iconSize: 200,
        icon: Icon(
          Icons.check_circle,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Material(
      child: SafeArea(
        child: Container(
          decoration: _complete ? BoxDecoration(color: Colors.green) : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Habit name',
                style: Theme.of(context).textTheme.headline2,
              ),
              Expanded(
                child: _buildCenter(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.today,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
