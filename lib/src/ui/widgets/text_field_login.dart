import 'package:flutter/material.dart';
import 'package:movies_v2/src/resources/colors.dart';
import 'package:movies_v2/src/resources/styles.dart';

class TextFieldLogin extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final IconData icon;
  final Function(String value) onChanged;

  const TextFieldLogin({
    Key? key,
    required this.title,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: obscureText,
            style: const TextStyle(
              color: WlColors.background,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                icon,
                color: WlColors.background,
              ),
              hintText: hintText,
              hintStyle: kHintTextStyle,
            ),
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}
