import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_v2/src/model/login/validation.dart';
import 'package:movies_v2/src/resources/colors.dart';
import 'package:movies_v2/src/ui/routes.dart';
import 'package:movies_v2/src/ui/widgets/background_login.dart';
import 'package:movies_v2/src/ui/widgets/btn_login.dart';
import 'package:movies_v2/src/ui/widgets/text_field_login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLogin(),
          Padding(
            padding: const EdgeInsets.only(
              top: 150.0,
              left: 30.0,
              right: 30.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Sing Up',
                    style: TextStyle(
                      color: WlColors.background,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFieldLogin(
                    title: 'Email',
                    hintText: 'Enter your Email',
                    obscureText: false,
                    icon: Icons.email,
                    validator: Validation.validateEmail(email),
                    onChanged: (value) => email = value,
                  ),
                  const SizedBox(height: 30.0),
                  TextFieldLogin(
                    title: 'Password',
                    hintText: 'Enter your Password',
                    obscureText: true,
                    icon: Icons.vpn_key,
                    validator: Validation.validatePassword(password),
                    onChanged: (value) => password = value,
                  ),
                  const SizedBox(height: 30),
              BtnLogin(
                title: 'SING UP',
                onPressed: () {
                  final newUser =  _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(newUser != null){
                    Navigator.pushNamed(context, Routes.homeScreen);
                  }
                },
              )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
