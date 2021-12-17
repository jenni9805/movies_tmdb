import 'package:flutter/material.dart';
import 'package:movies_v2/src/resources/colors.dart';

class BtnLogin extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const BtnLogin({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: MaterialButton(
        elevation: 5.0,
        padding: const EdgeInsets.all(15.0),
        color: WlColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: WlColors.gradientTwo,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
