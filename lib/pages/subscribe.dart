import 'package:flutter/material.dart';

import 'home.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key});

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('PICK A PLAN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ExpansionTile(
                      backgroundColor: Color(0xFFa02e49),
                      collapsedTextColor: Colors.white,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      collapsedBackgroundColor: Color(0xFFa02e49),
                      title: Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.white;
                              }
                              return Colors.white;
                            }),
                            value: 1,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                          Text(
                            'FREE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('FREE for Lifetime'),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      children: <Widget>[
                        ListTile(
                            title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              thickness: 2,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '● Add up to 5 products',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ExpansionTile(
                      backgroundColor: Color(0xFFa02e49),
                      collapsedTextColor: Colors.white,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      collapsedBackgroundColor: Color(0xFFa02e49),
                      title: Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.white;
                              }
                              return Colors.white;
                            }),
                            value: 2,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                          Text(
                            'STARTER',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('500 PHP / month'),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      children: <Widget>[
                        ListTile(
                            title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              thickness: 2,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '● Unlimited Products',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ExpansionTile(
                      backgroundColor: Color(0xFFa02e49),
                      collapsedTextColor: Colors.white,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      collapsedBackgroundColor: Color(0xFFa02e49),
                      title: Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.white;
                              }
                              return Colors.white;
                            }),
                            value: 3,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                          Text(
                            'BOSS',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('1000 PHP / month'),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      children: <Widget>[
                        ListTile(
                            title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              thickness: 2,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '● Unlimited Products',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '● Print Receipts',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
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
                          child: Text('CANCEL')),
                    ),
                    SizedBox(
                      width: 10,
                    ),
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
                          child: Text('PROCEED')),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
