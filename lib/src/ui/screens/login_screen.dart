import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_v2/src/notifiers/login_notifier.dart';
import 'package:movies_v2/src/notifiers/remember_notifier.dart';
import 'package:movies_v2/src/resources/colors.dart';
import 'package:movies_v2/src/resources/styles.dart';
import 'package:movies_v2/src/ui/routes.dart';
import 'package:movies_v2/src/ui/widgets/background_login.dart';
import 'package:movies_v2/src/ui/widgets/btn_login.dart';
import 'package:movies_v2/src/ui/widgets/text_field_login.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    var stateLogin = Provider.of<LoginNotifier>(
      context,
      listen: false,
    );

    var stateCheck = Provider.of<RememberNotifier>(
      context,
      listen: false,
    );

    bool _rememberMe = false;
    late String email;
    late String password;

    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
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
                          'Sing In',
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
                          onChanged: (value) => email = value,
                        ),
                        const SizedBox(height: 20),
                        TextFieldLogin(
                          title: 'Password',
                          hintText: 'Enter your Password',
                          obscureText: true,
                          icon: Icons.vpn_key,
                          onChanged: (value) => password = value,
                        ),
                        _buildForgotPasswordBtn(),
                        _buildRememberMeCheckBox(
                          state: stateCheck,
                        ),
                        BtnLogin(
                          title: 'LOGIN',
                          onPressed: () {
                            stateLogin.login();
                            final _auth = FirebaseAuth.instance;
                            final user = _auth.signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            if(user != null){
                              stateLogin.login();
                            }
                          },
                        ),
                        _buildSingUpBtn(
                          context: context,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: const Padding(
          padding: EdgeInsets.only(right: 0.0),
          child: Text(
            'Forgot Password?',
            style: kLabelStyle,
          ),
        ),
        onPressed: () => print('Pressed'),
      ),
    );
  }

  Widget _buildRememberMeCheckBox({
    required RememberNotifier state,
  }) {
    return SizedBox(
      height: 20.0,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: WlColors.background),
            child: Checkbox(
              value: state.isCheck(),
              checkColor: WlColors.five,
              activeColor: WlColors.gradientThree,
              onChanged: (value) {
                if (value == true) {
                  return state.isChecked();
                } else {
                  return state.isNotChecked();
                }
              },
            ),
          ),
          const Text(
            'Remember Me',
            style: kLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _buildSingUpBtn({required BuildContext context}) {
    return GestureDetector(
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.pushNamed(context, Routes.singUpScreen),
    );
  }
}
