import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _complete = false;

  void _completeTask() {
    setState(() {
      _complete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 310,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  height: 50,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText('Tap to complete'),
                    ],
                    repeatForever: true,
                  ),
                ),
                GestureDetector(
                  child: Image(
                    image: AssetImage(_complete
                        ? 'assets/images/sun.png'
                        : 'assets/images/cloud.png'),
                  ),
                  onTap: _completeTask,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/calender');
                      },
                      child: Icon(
                        Icons.today,
                        size: 40,
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size(120, 60),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/info');
                      },
                      child: Icon(
                        Icons.info_outline,
                        size: 40,
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size(120, 60),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
