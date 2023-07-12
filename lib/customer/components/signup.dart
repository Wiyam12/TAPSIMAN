import 'package:flutter/material.dart';

import '../pages/home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF934d5e),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xFF934d5e),
            Color(0xFFdf758e),
            Color(0xFFff8592)
          ]),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              height: 300,
              width: 300,
              // fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFea4b72),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        )),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFea4b72),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Register Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide.none)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Email',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                      TextField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person,
                                              color: Colors.white),
                                          hintText: 'Email',
                                          filled: true,
                                          fillColor: Color(0xFFffa2ae),
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide.none)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Username',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                      TextField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person,
                                              color: Colors.white),
                                          hintText: 'Username',
                                          filled: true,
                                          fillColor: Color(0xFFffa2ae),
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide.none)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Password',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                      TextField(
                                        obscureText: _obscureText,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.key,
                                              color: Colors.white),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                            icon: Icon(
                                              _obscureText
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.white,
                                            ),
                                          ),
                                          hintText: 'Password',
                                          filled: true,
                                          fillColor: Color(0xFFffa2ae),
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.of(context).pushReplacement(
                              //   MaterialPageRoute(
                              //     builder: (context) => HomePageCustomer(),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                color: Color(0xFFff7e6a),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                  child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
