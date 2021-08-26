import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  bool _textInput = false;
  final inputTextController = TextEditingController();

  void _handleSubmit() {
    print(inputTextController.text);
  }

  void _enableInput() {
    setState(() {
      _textInput = true;
    });
  }

  @override
  void dispose() {
    inputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? hintText = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(color: Color(0x7FFFFFFF));
    Widget placeholder;

    if (!_textInput) {
      placeholder = AnimatedTextKit(
        onTap: _enableInput,
        animatedTexts: [
          TyperAnimatedText(
            'read a page',
            textStyle: hintText,
            speed: const Duration(milliseconds: 100),
          ),
          TyperAnimatedText(
            'meditate',
            textStyle: hintText,
            speed: const Duration(milliseconds: 100),
          ),
          TyperAnimatedText(
            'go for a walk',
            textStyle: hintText,
            speed: const Duration(milliseconds: 100),
          ),
        ],
        repeatForever: true,
      );
    } else {
      placeholder = TextField(
        controller: inputTextController,
        minLines: 1,
        maxLines: 3,
        autofocus: true,
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.go,
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
          hintText: 'read a page',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: Color(0x7FFFFFFF)),
          border: InputBorder.none,
        ),
        onEditingComplete: _handleSubmit,
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _enableInput,
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    children: [
                      Text('I want to'),
                      placeholder,
                      Text('every day'),
                    ],
                  ),
                ),
                TextButton(onPressed: _handleSubmit, child: Text('Next'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
