import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({Key? key}) : super(key: key);

  //Asset images
  @override
  State<CalenderView> createState() => _CalenderViewState();

  static const _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static const _daysInMonth = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31,
  ];
}

class _CalenderViewState extends State<CalenderView> {
  final _imageSun = const AssetImage('assets/images/sun.png');
  final _imageCloud = const AssetImage('assets/images/cloud.png');

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('AppData');
    final currentStreak = box.get('currentStreak', defaultValue: 0);
    final longestStreak = box.get('longestStreak', defaultValue: 0);

    return Scaffold(
      appBar: AppBar(
          //title: const Text('history'),
          ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: PageView.builder(
                  reverse: true,
                  itemBuilder: _buildCalenderPage,
                  controller: _pageController,
                ),
              ),
              Flexible(
                child: Text(
                  'Current streak: ${currentStreak.toString()}\n'
                  'Longest streak: ${longestStreak.toString()}',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int getDaysInMonth(int month, int year) {
    if (month == 2) {
      if (year % 4 == 0) {
        if (year % 100 == 0) {
          if (year % 400 == 0) {
            return 29;
          }
          return 28;
        }
        return 29;
      }
      return 28;
    }
    return CalenderView._daysInMonth[month - 1];
  }

  Widget _buildCalenderPage(BuildContext context, int index) {
    final today = DateTime.now();

    int currentMonth = (today.month - index) % 12;
    if (currentMonth == 0) {
      currentMonth = 12;
    }
    int currentYear = today.year - (index + currentMonth - 1) ~/ 12;

    //Hive box
    var box = Hive.box('AppData');

    //Create temporary list to show calendar
    List<Widget> _widgetList = [];
    for (int i = 0; i < getDaysInMonth(currentMonth, currentYear); i++) {
      //_widgetList.add(Text(i.toString()));
      var todayString = '$currentYear'
          '${currentMonth.toString().padLeft(2, '0')}'
          '${(i + 1).toString().padLeft(2, '0')}';
      _widgetList.add(
        Image(
          image: box.get(
            todayString,
            defaultValue: false,
          )
              ? _imageSun
              : _imageCloud,
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                _pageController.jumpToPage(_pageController.page!.toInt() + 1);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
            ),
            Text(CalenderView._months[currentMonth - 1] +
                ' ' +
                currentYear.toString()),
            IconButton(
              onPressed: () {
                if (_pageController.page! > 0) {
                  _pageController.jumpToPage(_pageController.page!.toInt() - 1);
                }
              },
              icon: const Icon(Icons.arrow_forward),
              color: Colors.white,
            )
          ],
        ),
        Flexible(
          child: GridView.count(
            crossAxisCount: 7,
            children: _widgetList,
          ),
        )
      ],
    );
  }
}
