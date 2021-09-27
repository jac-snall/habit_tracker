import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key}) : super(key: key);

  void _resetData(BuildContext context) async {
    await Hive.deleteBoxFromDisk('AppData');
    await Hive.openBox('AppData');
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/startview', (route) => false);
  }

  void _showAlertDialog(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      title: const Text('Reset data'),
      content: const Text(
          'Do you want to reset all data? This action is irreversible.'),
      actions: [
        TextButton(
          onPressed: () => {Navigator.of(context).pop()},
          child: const Text('Cancel'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            primary: Colors.blue,
            minimumSize: const Size(40, 40),
          ),
        ),
        TextButton(
          onPressed: () => _resetData(context),
          child: const Text('Yes'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            primary: Colors.blue,
            minimumSize: const Size(40, 40),
          ),
        )
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Info'),
            Text(
              'Info about the app. Link to sun and cloud emoji',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextButton(
              onPressed: () => _showAlertDialog(context),
              child: const Text('Reset'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
