import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user/customer/pages/home.dart';
import 'package:user/pages/home.dart';

import 'components/cancel_button.dart';
import 'components/input_container.dart';
import 'constrants.dart';
import 'customer/pages/storespage.dart';
import 'forgotpassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final List<List<String>> userData = [
    ["entrep@gmail.com", "entrep123", "entrepreneur"],
    ["customer@gmail.com", "customer123", "customer"]
  ];
  bool isLogin = true;
  bool entrep = true;
  AnimationController? animationController;
  Duration animationDuration = Duration(milliseconds: 270);
  late Animation<double> containerSize;
  bool _isLoading = false;
// firebase
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
//  form
  final _formKey = GlobalKey<FormState>();
  final _formKeyReg = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  String signupButtonText = 'SIGN UP';
  String loginButtonText = 'LOGIN';
  bool isloginButtonEnabled = true;
  bool isSignupButtonEnabled = true;
  // end  form

  //Registration controller
  final _NameController = new TextEditingController();
  final _numberController = new TextEditingController();
  final _addressController = new TextEditingController();
  final _businessController = new TextEditingController();
  final _emailControllerReg = new TextEditingController();
  final _passwordControllerReg = new TextEditingController();
  final _confirmPasswordController = new TextEditingController();
  final _imageFileController = new TextEditingController();
  File? _businessPermit;
  String _errorMessage = '';

  void _signup() async {
    if (_formKey.currentState!.validate()) {}
  }

  Future<String> uploadBusinessPermit(File file) async {
    // You need to set up Firebase Storage in your project.
    // Replace 'business_permits' with your own storage folder.
    final ref = FirebaseStorage.instance
        .ref()
        .child('business_permits')
        .child(file.path);
    final uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.whenComplete(() => null);
    return await snapshot.ref.getDownloadURL();
  }

  void _pickBusinessPermit() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _imageFileController.text = result.files.single.name;
        _businessPermit = File(result.files.single.path!);
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loginButtonText = 'Please wait...';
        isloginButtonEnabled = false;
      });
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

        // Retrieve the user document from Firestore
        DocumentSnapshot userSnapshot = await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        if (userSnapshot.exists) {
          var userData = userSnapshot.data() as Map<String, dynamic>;
          var status = userData['status'];
          var userlevel = userData['userlevel'];
          if (userlevel == 'customer') {
            if (_rememberMe) {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('loggedIn', true);
              prefs.setString(
                  'userType', 'customer'); // or 'pos' based on the user type
            }
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => StorePage(),
              ),
            );
          } else if (status == 'approved') {
            if (userlevel == 'entrep') {
              if (_rememberMe) {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('loggedIn', true);
                prefs.setString(
                    'userType', 'entrep'); // or 'pos' based on the user type
              }
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }
            // User is approved, proceed with login
            // Navigate to the next screen or perform necessary actions
          } else {
            // showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         contentPadding: EdgeInsets.zero,
            //         titlePadding: EdgeInsets.only(top: 16, bottom: 8),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(20.0),
            //           side: BorderSide(
            //             color: Color(0xFFa02e49),
            //             width: 3.0,
            //           ),
            //         ),
            //         title: Text(
            //           'Login Failed',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(fontWeight: FontWeight.bold),
            //         ),
            //         content: SizedBox(
            //           height: 120,
            //           child: Column(
            //             children: [
            //               FittedBox(
            //                   child: Text(
            //                       'Your account is not yet approved. Please wait for approval')),
            //               Text('Please try again.'),
            //               SizedBox(height: 10),
            //               Divider(
            //                 thickness: 2,
            //               ),
            //               Center(
            //                 child: TextButton(
            //                     onPressed: () {
            //                       Navigator.of(context).pop();
            //                     },
            //                     child: Text('OK',
            //                         style: TextStyle(
            //                             fontSize: 20,
            //                             color: Color(0xFFa02e49),
            //                             fontWeight: FontWeight.bold))),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     });
            setState(() {
              _errorMessage =
                  'Your account is not yet approved. Please wait for approval.';
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      titlePadding: EdgeInsets.only(top: 16, bottom: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: Color(0xFFa02e49),
                          width: 3.0,
                        ),
                      ),
                      title: Text(
                        'Login Failed',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: SizedBox(
                        height: 120,
                        child: Column(
                          children: [
                            FittedBox(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('$_errorMessage'),
                            )),
                            Text('Please try again.'),
                            SizedBox(height: 10),
                            Divider(
                              thickness: 2,
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFFa02e49),
                                          fontWeight: FontWeight.bold))),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text('$_errorMessage'),
              //   ),
              // );
            });
          }
        }
        setState(() {
          loginButtonText = 'LOGIN.';
          isloginButtonEnabled = true;
        });
      } catch (e) {
        setState(() {
          loginButtonText = 'LOGIN';
          isloginButtonEnabled = true;
          _errorMessage = 'Invalid email or password. Please try again.';
        });
        // setState(() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.only(top: 16, bottom: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    color: Color(0xFFa02e49),
                    width: 3.0,
                  ),
                ),
                title: Text(
                  'Login Failed',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      FittedBox(child: Text('$_errorMessage')),
                      Text('Please try again.'),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFa02e49),
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  ),
                ),
              );
            });

        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('$_errorMessage'),
        //   ),
        // );
        // });
      }
      // String email = _emailController.text;
      // String password = _passwordController.text;

      // String userType = _getUserType(email, password);

      // if (userType == "entrepreneur") {
      //   // Navigate to entrepreneur page
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(
      //       builder: (context) => HomePage(),
      //     ),
      //   );
      // } else if (userType == "customer") {
      //   // Navigate to customer page
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(
      //       builder: (context) => StorePage(),
      //     ),
      //   );
      // } else {

      //   },
      // );
      // }
    }
  }

  String _getUserType(String email, String password) {
    for (var user in userData) {
      if (user[0] == email && user[1] == password) {
        return user[2];
      }
    }
    return "";
  }

  void _requestFilePermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    statuses.forEach((permission, status) {
      if (!status.isGranted) {
        print('Permission not granted: $permission');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
    _requestFilePermissions();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

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
                                'assets/images/logo.png',
                                width: 150,
                              ),
                              // SvgPicture.asset('assets/images/login.svg'),
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
                                    _submitForm();

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
                                    '$loginButtonText',
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
                                        'assets/images/logo.png',
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
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            entrep = true;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 2,
                                              color: Color(0xFFa02e49),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: entrep
                                                ? Color.fromARGB(63, 255, 0, 0)
                                                : Colors.transparent,
                                          ),
                                          padding: EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.store,
                                                color: Color(0xFFa02e49),
                                                size: 40,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("I'm"),
                                                  Text(
                                                    'Entrepreneur',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFa02e49),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            entrep = false;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 2,
                                              color: Color(0xFFa02e49),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: entrep
                                                ? Colors.transparent
                                                : Color.fromARGB(63, 255, 0, 0),
                                          ),
                                          padding: EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.emoji_people_outlined,
                                                color: Color(0xFFa02e49),
                                                size: 40,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("I'm"),
                                                  Text(
                                                    'Customer',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFa02e49),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
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
                                if (entrep)
                                  InputContainer(
                                      child: TextFormField(
                                    cursorColor: kPrimaryColor,
                                    autocorrect: false,
                                    controller: _addressController,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Address';
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (_) =>
                                        FocusScope.of(context).nextFocus(),
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.location_on_outlined,
                                            color: kPrimaryColor),
                                        hintText: 'Address',
                                        border: InputBorder.none),
                                  )),
                                if (entrep)
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
                                if (entrep)
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
                                if (entrep)
                                  TextButton(
                                    child: const Text('Upload Business Permit'),
                                    onPressed: _pickBusinessPermit,
                                    // onPressed: () {
                                    //   _pickBusinessPermit;
                                    //   // _pickImage(ImageSource.gallery);
                                    // },
                                  ),
                                SizedBox(height: 10),
                                InkWell(
                                  onTap: () async {
                                    if (isSignupButtonEnabled) {
                                      if (_formKeyReg.currentState!
                                          .validate()) {
                                        if (_businessPermit == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Must upload Business Permit.'),
                                            ),
                                          );
                                        } else {
                                          setState(() {
                                            signupButtonText = 'Please wait...';
                                            isSignupButtonEnabled = false;
                                          });
                                          try {
                                            DateTime today = DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day,
                                              0, // hour value of 0 represents 12:00 AM
                                              0, // minute value of 0
                                              0, // second value of 0
                                              0, // millisecond value of 0
                                            );
                                            String? userlevel;
                                            if (entrep) {
                                              userlevel = 'entrep';
                                            } else {
                                              userlevel = 'customer';
                                            }

                                            final userCredential = await _auth
                                                .createUserWithEmailAndPassword(
                                              email:
                                                  _emailController.text.trim(),
                                              password:
                                                  _passwordController.text,
                                            );

                                            await userCredential.user!
                                                .updateProfile(
                                                    displayName:
                                                        _NameController.text);
                                            await userCredential.user!.reload();
                                            if (entrep) {
                                              await userCredential.user!
                                                  .getIdToken()
                                                  .then((value) => {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection('users')
                                                            .doc(userCredential
                                                                .user!.uid)
                                                            .set({
                                                          'name':
                                                              _NameController
                                                                  .text,
                                                          'email':
                                                              _emailController
                                                                  .text
                                                                  .trim(),
                                                          'number':
                                                              _numberController
                                                                  .text,
                                                          'address':
                                                              _addressController
                                                                  .text,
                                                          'businessname':
                                                              _businessController
                                                                  .text,
                                                          'userlevel':
                                                              userlevel,
                                                          'status': 'pending',
                                                          'plan': 'free'
                                                        })
                                                      });
                                              //  success uploading file
                                              String? businessPermitUrl;
                                              final ref = FirebaseStorage
                                                  .instance
                                                  .ref()
                                                  .child('business_permits')
                                                  .child(
                                                      '${userCredential.user!.uid}')
                                                  .child('business_permit');
                                              final uploadTask =
                                                  ref.putFile(_businessPermit!);
                                              final snapshot = await uploadTask
                                                  .whenComplete(() => null);

                                              businessPermitUrl = await snapshot
                                                  .ref
                                                  .getDownloadURL();
                                              final userRef = FirebaseFirestore
                                                  .instance
                                                  .collection('users')
                                                  .doc(
                                                      userCredential.user!.uid);

                                              await userRef.update({
                                                'businesspermit':
                                                    businessPermitUrl,
                                              });
                                            } else {
                                              await userCredential.user!
                                                  .getIdToken()
                                                  .then((value) => {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection('users')
                                                            .doc(userCredential
                                                                .user!.uid)
                                                            .set({
                                                          'name':
                                                              _NameController
                                                                  .text,
                                                          'email':
                                                              _emailController
                                                                  .text
                                                                  .trim(),
                                                          'number':
                                                              _numberController
                                                                  .text,

                                                          'userlevel':
                                                              userlevel,
                                                          'id_token': value,
                                                          // 'tutorial': tutorial,
                                                          'coin': 0,
                                                          'dailycoin': true,
                                                          'dailytokendate':
                                                              today,
                                                        })
                                                      });
                                            }

                                            // success uploading file
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'User successfully registered'),
                                              ),
                                            );
                                            animationController!.reverse();
                                            setState(() {
                                              isLogin = !isLogin;
                                              signupButtonText = 'SIGN UP';
                                              isSignupButtonEnabled = true;
                                            });

                                            // Navigator.of(context).pushReplacement(
                                            //   MaterialPageRoute(
                                            //     builder: (context) => LoginScreen(),
                                            //   ),
                                            // );
                                          } on FirebaseAuthException catch (e) {
                                            setState(() {
                                              _errorMessage = e.message!;
                                            });
                                          }
                                        }
                                      }
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
                                      '$signupButtonText',
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
