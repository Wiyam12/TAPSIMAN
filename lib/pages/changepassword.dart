import 'package:flutter/material.dart';
import 'package:user/pages/accountdetails.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  Color maincolor = Color(0xFFa02e49);
  bool showpassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ACCOUNT DETAILS'),
        backgroundColor: maincolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                Text(
                  "Please don't share your password to anyone",
                  style: TextStyle(
                      color: maincolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        obscureText: !showpassword,
                        style: TextStyle(
                            color: maincolor, fontWeight: FontWeight.bold),
                        decoration: buildInputDecoration('Old Password'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: !showpassword,
                        style: TextStyle(
                            color: maincolor, fontWeight: FontWeight.bold),
                        decoration: buildInputDecoration('New Password'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: !showpassword,
                        style: TextStyle(
                            color: maincolor, fontWeight: FontWeight.bold),
                        decoration: buildInputDecoration('Confirm Password'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.disabled)) {
                                      return maincolor.withOpacity(.32);
                                    }
                                    return maincolor;
                                  }),
                                  value: showpassword,
                                  onChanged: (value) {
                                    setState(() {
                                      showpassword = !showpassword;
                                    });
                                  }),
                              Text(
                                'Show Password',
                                style: TextStyle(
                                    color: maincolor.withOpacity(0.8)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFa02e49))),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AccountDetailsPage(),
                              ),
                            );
                          },
                          child: Text('CONFIRM')),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

InputDecoration buildInputDecoration(String hinttext) {
  Color maincolor = Color(0xFFa02e49);
  return InputDecoration(
    filled: true,
    fillColor: Colors.white.withOpacity(0.5),
    contentPadding: EdgeInsets.symmetric(
      vertical: 8.0,
      horizontal: 16.0,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: maincolor, width: 2.0),
      borderRadius: BorderRadius.circular(30.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: maincolor, width: 2.0),
      borderRadius: BorderRadius.circular(30.0),
    ),
    hintText: hinttext,
    hintStyle: TextStyle(color: maincolor.withOpacity(0.5)),
    prefixIconConstraints: BoxConstraints(minWidth: 40),
  );
}
