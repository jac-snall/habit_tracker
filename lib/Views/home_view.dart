import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _complete = false;

  @override
  void initState() {
    var box = Hive.box('AppData');
    _complete = box.get(DateFormat('yyyyMMdd').format(DateTime.now())) != null;
    super.initState();
  }

  void _completeTask() {
    //Save date to hive box
    var box = Hive.box('AppData');
    box.put(DateFormat('yyyyMMdd').format(DateTime.now()), true);

    //Updating streak
    var currentStreak = box.get('currentStreak', defaultValue: 0);
    if (box.get(
      DateFormat('yyyyMMdd').format(DateTime.now().subtract(
        const Duration(days: 1),
      )),
      defaultValue: false,
    )) {
      currentStreak++;
    } else {
      currentStreak = 1;
    }
    box.put('currentStreak', currentStreak);

    var longestStreak = box.get('longestStreak', defaultValue: 0);
    if (currentStreak > longestStreak) box.put('longestStreak', currentStreak);

    setState(() {
      _complete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Get habit name from hive
    var box = Hive.box('AppData');
    final habitName = box.get('Habit');

    final centerWidget = _complete
        ? [
            const Image(image: AssetImage('assets/images/sun.png')),
            const Text('Well done!'),
          ]
        : [
            GestureDetector(
              child: const Image(
                image: AssetImage('assets/images/cloud.png'),
              ),
              onTap: _completeTask,
            ),
            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText('Tap to complete'),
              ],
              repeatForever: true,
            ),
          ];

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 310,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  'I want to $habitName',
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Flexible(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: centerWidget,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/calender');
                        },
                        child: const Icon(
                          Icons.today,
                          size: 40,
                        ),
                        style: TextButton.styleFrom(
                          minimumSize: const Size(120, 60),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/info');
                        },
                        child: const Icon(
                          Icons.info_outline,
                          size: 40,
                        ),
                        style: TextButton.styleFrom(
                          minimumSize: const Size(120, 60),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
