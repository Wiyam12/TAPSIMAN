import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isExpanded = false;
  final _emailController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('Forgot Password?',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Image.asset(
                      'assets/images/forgot-sad.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    Text(
                      'Enter the email address',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'associated with your account.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'We will email you a link to reset and you can change it after. ',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          label: const Center(
                            child: Text("Enter Email Address"),
                          ),
                          alignLabelWithHint: true,
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Email Address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // setState(() {
                            //   _isExpanded = !_isExpanded;
                            // });
                            // checkEmail(_emailController.text);

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SuccessForgot()));
                          }
                        },
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            height: 55,
                            width: 250,
                            margin: EdgeInsets.all(16),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFa02e49), width: 2),
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: _isExpanded
                                    ? [Colors.white, Colors.white]
                                    : [Color(0xFFa02e49), Colors.pinkAccent],
                              ),
                            ),
                            child: Center(
                                child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                'Send',
                                style: TextStyle(
                                    color: _isExpanded
                                        ? Colors.deepPurple
                                        : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
