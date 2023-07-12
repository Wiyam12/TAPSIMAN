import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:user/components/rounded_button.dart';
import 'package:user/components/rounded_input.dart';
import 'package:user/components/rounded_password_input.dart';

class RegisterForm extends StatefulWidget {
  //  const RegisterForm({super.key});
  const RegisterForm({
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
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: widget.size.width,
            height: widget.defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 40),
                  SvgPicture.asset('assets/images/register.svg'),
                  SizedBox(height: 40),
                  RoundedInput(icon: Icons.mail, hint: 'Email'),
                  RoundedInput(icon: Icons.face_rounded, hint: 'Name'),
                  RoundedInput(icon: Icons.face_rounded, hint: 'Business Name'),
                  RoundedPasswordInput(hint: 'Password'),
                  RoundedPasswordInput(hint: 'Confirm Password'),
                  SizedBox(height: 10),
                  RoundedButton(title: 'SIGN UP'),
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
