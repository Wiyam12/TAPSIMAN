import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';

import 'components/cancel_button.dart';
import 'components/input_container.dart';
import 'constrants.dart';
import 'forgotpassword.dart';
import 'pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;

  AnimationController? animationController;
  Duration animationDuration = Duration(milliseconds: 270);
  late Animation<double> containerSize;
  bool _isLoading = false;

//  form
  final _formKey = GlobalKey<FormState>();
  final _formKeyReg = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  // end  form

  //Registration controller
  final _NameController = new TextEditingController();
  final _lastNameController = new TextEditingController();
  final _numberController = new TextEditingController();
  final _businessController = new TextEditingController();
  final _emailControllerReg = new TextEditingController();
  final _passwordControllerReg = new TextEditingController();
  final _confirmPasswordController = new TextEditingController();
  final _imageFileController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize =
        Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
            .animate(CurvedAnimation(
                parent: animationController!, curve: Curves.linear));
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                // Lets add some decorations
                Positioned(
                    top: 100,
                    right: -50,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kPrimaryColor),
                    )),

                Positioned(
                    top: -50,
                    left: -50,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kPrimaryColor),
                    )),

                // Cancel Button
                CancelButton(
                  isLogin: isLogin,
                  animationDuration: animationDuration,
                  size: size,
                  animationController: animationController,
                  tapEvent: isLogin
                      ? null
                      : () {
                          // returning null to disable the button
                          animationController!.reverse();
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                ),

                // Login Form
                AnimatedOpacity(
                  opacity: isLogin ? 1.0 : 0.0,
                  duration: animationDuration * 4,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: size.width,
                      height: defaultLoginSize,
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(height: 10),
                              Image.asset(
                                'images/logo.png',
                                width: 150,
                              ),
                              // SvgPicture.asset('images/login.svg'),
                              // SizedBox(height: 40),
                              InputContainer(
                                  child: TextFormField(
                                autocorrect: false,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _emailController.text = value!;
                                },
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                    icon:
                                        Icon(Icons.mail, color: kPrimaryColor),
                                    hintText: 'Email',
                                    border: InputBorder.none),
                              )),
                              // RoundedInput(icon: Icons.mail, hint: 'Username'),
                              InputContainer(
                                  child: TextFormField(
                                cursorColor: kPrimaryColor,
                                autocorrect: false,
                                controller: _passwordController,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _passwordController.text = value!;
                                },
                                decoration: InputDecoration(
                                    icon:
                                        Icon(Icons.lock, color: kPrimaryColor),
                                    hintText: 'Password',
                                    border: InputBorder.none),
                              )),
                              // RoundedPasswordInput(hint: 'Password'),
                              SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  // print('asd');
                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => HomeScreen(
                                  //       currentIndex: 0,
                                  //     ),
                                  //   ),
                                  // );
                                  if (_formKey.currentState!.validate()) {
                                    // Navigator.of(context).pushReplacement(
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         HomePageCustomer(),
                                    //   ),
                                    // );
                                    // setState(() {
                                    //   _isLoading = true;
                                    // });
                                    // _login();
                                  }
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword(),
                                          ),
                                        );
                                      },
                                      child: Text('Forgot Password?'))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value!;
                                        });
                                      },
                                    ),
                                    Text('Remember me'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Register Container
                AnimatedBuilder(
                  animation: animationController!,
                  builder: (context, child) {
                    if (viewInset == 0 && isLogin) {
                      return buildRegisterContainer();
                    } else if (!isLogin) {
                      return buildRegisterContainer();
                    }

                    // Returning empty container to hide the widget
                    return Container();
                  },
                ),

                // Register Form
                AnimatedOpacity(
                  opacity: isLogin ? 0.0 : 1.0,
                  duration: animationDuration * 5,
                  child: Visibility(
                    visible: !isLogin,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width,
                        height: defaultLoginSize,
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKeyReg,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'images/logo.png',
                                        width: 150,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Welcome',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                                color: Color(0xFFa02e49)),
                                          ),
                                          Text('Sign Up, and join us!',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFFa02e49)))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                InputContainer(
                                    child: TextFormField(
                                  cursorColor: kPrimaryColor,
                                  autocorrect: false,
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    } else if (value.isEmpty ||
                                        !RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b')
                                            .hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context).nextFocus(),
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.mail,
                                          color: kPrimaryColor),
                                      hintText: 'Email',
                                      border: InputBorder.none),
                                )),
                                InputContainer(
                                    child: TextFormField(
                                  autocorrect: false,
                                  controller: _NameController,
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _NameController.text = value!;
                                  },
                                  cursorColor: kPrimaryColor,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.face_rounded,
                                          color: kPrimaryColor),
                                      hintText: 'Name',
                                      border: InputBorder.none),
                                )),
                                InputContainer(
                                    child: TextFormField(
                                  autocorrect: false,
                                  controller: _numberController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^09\d{9}$');
                                    if (value!.isEmpty) {
                                      return 'Please enter your number';
                                    } else if (!regex.hasMatch(value)) {
                                      return 'Please Enter valid mobile number';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _numberController.text = value!;
                                  },
                                  cursorColor: kPrimaryColor,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.phone,
                                          color: kPrimaryColor),
                                      hintText: 'Number',
                                      border: InputBorder.none),
                                )),
                                InputContainer(
                                    child: TextFormField(
                                  cursorColor: kPrimaryColor,
                                  autocorrect: false,
                                  controller: _businessController,
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your Business Name';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context).nextFocus(),
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.storefront_outlined,
                                          color: kPrimaryColor),
                                      hintText: 'Business Name',
                                      border: InputBorder.none),
                                )),
                                InputContainer(
                                    child: TextFormField(
                                  cursorColor: kPrimaryColor,
                                  autocorrect: false,
                                  controller: _passwordController,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    } else if (value !=
                                        _passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context).nextFocus(),
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.lock,
                                          color: kPrimaryColor),
                                      hintText: 'Password',
                                      border: InputBorder.none),
                                )),
                                InputContainer(
                                    child: TextFormField(
                                  cursorColor: kPrimaryColor,
                                  autocorrect: false,
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context).nextFocus(),
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.lock,
                                          color: kPrimaryColor),
                                      hintText: 'Confirm Password',
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please confirm your password';
                                    } else if (value !=
                                        _passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                )),
                                SizedBox(height: 10),
                                InputContainer(
                                    child: TextFormField(
                                  cursorColor: kPrimaryColor,
                                  autocorrect: false,
                                  readOnly: true,
                                  controller: _imageFileController,
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context).nextFocus(),
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.lock,
                                          color: kPrimaryColor),
                                      hintText: 'Business Permit',
                                      border: InputBorder.none),
                                )),
                                TextButton(
                                  child: const Text('Upload Business Permit'),
                                  onPressed: () {
                                    // _pickImage(ImageSource.gallery);
                                  },
                                ),
                                SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    if (_formKeyReg.currentState!.validate()) {
                                      // if (_imageFile != null) {
                                      //   setState(() {
                                      //     _isLoading = true;
                                      //   });
                                      //   _register();
                                      // } else {
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(
                                      //     SnackBar(
                                      //         content: Text(
                                      //             'Must add Business Permit')),
                                      //   );
                                      // }
                                    }
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
                                      'SIGN UP',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                // RoundedInput(icon: Icons.mail, hint: 'Email'),
                                // RoundedInput(icon: Icons.face_rounded, hint: 'Name'),
                                // RoundedInput(icon: Icons.face_rounded, hint: 'Business Name'),
                                // RoundedPasswordInput(hint: 'Password'),
                                // RoundedPasswordInput(hint: 'Confirm Password'),
                                // SizedBox(height: 10),
                                // RoundedButton(title: 'SIGN UP'),
                                // SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: kBackgroundColor),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
                  animationController!.forward();

                  setState(() {
                    isLogin = !isLogin;
                  });
                },
          child: isLogin
              ? Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: kPrimaryColor, fontSize: 18),
                )
              : null,
        ),
      ),
    );
  }
}
