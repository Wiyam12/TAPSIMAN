import 'package:flutter/material.dart';
import 'package:user/pages/changepassword.dart';
import 'package:user/pages/home.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  Color maincolor = Color(0xFFa02e49);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
                  TextFormField(
                    initialValue: "Cora's Tapsilugan",
                    style: TextStyle(
                        color: maincolor, fontWeight: FontWeight.bold),
                    decoration: buildInputDecoration(Icons.people, 'Name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: "corastapsilugan23@gmail.com",
                    style: TextStyle(
                        color: maincolor, fontWeight: FontWeight.bold),
                    decoration: buildInputDecoration(Icons.email, 'Email'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: "Cora's Tapsilugan",
                    style: TextStyle(
                        color: maincolor, fontWeight: FontWeight.bold),
                    decoration: buildInputDecoration(Icons.store, 'Store'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: "09123456789",
                    style: TextStyle(
                        color: maincolor, fontWeight: FontWeight.bold),
                    decoration:
                        buildInputDecoration(Icons.phone, 'Contact Number'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordPage(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(maincolor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                          child: Text(
                            'CHANGE PASSWORD',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          child: Text('SAVE')),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

InputDecoration buildInputDecoration(IconData icons, String hinttext) {
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
    hintStyle: TextStyle(color: maincolor),
    prefixIcon: Icon(icons, color: maincolor),
    prefixIconConstraints: BoxConstraints(minWidth: 40),
  );
}
