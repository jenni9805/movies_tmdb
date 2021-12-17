import 'package:flutter/material.dart';
import 'package:movies_v2/src/resources/colors.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            WlColors.gradientFour,
            WlColors.gradientThree,
            WlColors.gradientTwo,
            WlColors.gradientOne,
          ],
          stops: [
            0.1,
            0.4,
            0.7,
            0.9,
          ],
        ),
      ),
    );
  }
}
