import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: const Text('history'),
          ),
      body: PageView.builder(
        reverse: true,
        itemBuilder: _buildCalenderPage,
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

  Widget _buildCalenderPage(BuildContext context, int index) {
    final today = DateTime.now();
    //final currentMonth = DateTime(today.year, today.month - index, 1);
    final currentMonth = today.subMonths(index);
    //Create temporary list to show calendar
    List<Widget> _widgetList = [];
    var _image = const AssetImage('assets/images/cloud.png');
    for (int i = 0; i < currentMonth.getDaysInMonth; i++) {
      //_widgetList.add(Text(i.toString()));
      _widgetList.add(Image(image: _image));
    }
    var _imageSun = const AssetImage('assets/images/sun.png');
    _widgetList[0] = Image(image: _imageSun);
    _widgetList[14] = Image(image: _imageSun);
    //_widgetList[27] = Image(image: _imageSun);

    return Column(
      children: [
        Text(_months[currentMonth.month - 1] +
            ' ' +
            currentMonth.year.toString()),
        SizedBox(
          height: 400,
          width: 350,
          child: GridView.count(
            crossAxisCount: 7,
            children: _widgetList,
          ),
        )
      ],
    );
  }
}
