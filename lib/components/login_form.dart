import 'package:flutter/material.dart';
import 'package:user/components/rounded_password_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constrants.dart';
import 'input_container.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 40),
                  SvgPicture.asset('assets/images/login.svg'),
                  SizedBox(height: 40),
                  InputContainer(
                      child: TextFormField(
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                        icon: Icon(Icons.mail, color: kPrimaryColor),
                        hintText: 'Username',
                        border: InputBorder.none),
                  )),
                  // RoundedInput(icon: Icons.mail, hint: 'Username'),
                  RoundedPasswordInput(hint: 'Password'),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      print('asd');
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => HomeScreen(
                      //       currentIndex: 0,
                      //     ),
                      //   ),
                      // );
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.center,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
