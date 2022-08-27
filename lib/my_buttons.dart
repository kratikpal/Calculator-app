import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final Function action;
  const MyButton({Key? key, required this.buttonText, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        action();
      },
      style: ElevatedButton.styleFrom(minimumSize: const Size(100, 35)),
      child: buttonText.text.xl3.make(),
    );
  }
}
