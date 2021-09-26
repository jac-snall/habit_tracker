import 'package:flutter/material.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: const Text('history'),
          ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: PageView.builder(
                  reverse: true,
                  itemBuilder: _buildCalenderPage,
                ),
              ),
              const Flexible(
                child: Text('Current streak: 55\nLongest streak: 55'),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
    return _daysInMonth[month - 1];
  }

  Widget _buildCalenderPage(BuildContext context, int index) {
    final today = DateTime.now();

    int currentMonth = (today.month - index) % 12;
    if (currentMonth == 0) {
      currentMonth = 12;
    }
    int currentYear = today.year - (index + currentMonth - 1) ~/ 12;

    //Create temporary list to show calendar
    List<Widget> _widgetList = [];
    var _image = const AssetImage('assets/images/cloud.png');
    for (int i = 0; i < getDaysInMonth(currentMonth, currentYear); i++) {
      //_widgetList.add(Text(i.toString()));
      _widgetList.add(Image(image: _image));
    }
    var _imageSun = const AssetImage('assets/images/sun.png');
    _widgetList[0] = Image(image: _imageSun);
    _widgetList[14] = Image(image: _imageSun);

    return Column(
      children: [
        Text(_months[currentMonth - 1] + ' ' + currentYear.toString()),
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
