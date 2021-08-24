import 'package:flutter/material.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('I want to'),
                TextField(
                  minLines: 1,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    hintText: 'read a page',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Color(0x7FFFFFFF)),
                    border: InputBorder.none,
                  ),
                ),
                Text('every day'),
                TextButton(onPressed: null, child: Text('Next'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
