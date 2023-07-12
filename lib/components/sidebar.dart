import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user/login.dart';
import 'package:user/pages/accountdetails.dart';
import 'package:user/pages/subscribe.dart';
import 'package:user/pages/syncingloglist.dart';

import '../main.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({super.key});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Color maincolor = Color(0xFFa02e49);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Juan Miguel Tampicoss',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                'juanmigueltampico@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(color: Color(0xFFd298a6)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Text(
                      'DATA SYNC',
                      style: TextStyle(fontSize: 12, color: Color(0xFFa02e49)),
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xFFa02e49),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/upload.png',
                        width: 40,
                      ),
                      title: Text(
                        'UPLOAD DATA TO SERVER',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFa02e49)),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: DialogContent(
                              type: 'UPLOAD',
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/cloud-download.png',
                        width: 40,
                      ),
                      title: Text(
                        'DOWNLOAD DATA FROM SERVER',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFa02e49)),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: DialogContent(
                              type: 'DOWNLOAD',
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/sync.png',
                        width: 40,
                      ),
                      title: Text(
                        'SYNCING LOG LIST',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFa02e49)),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SyncingLogListPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'ACCOUNT INFORMATION',
                      style: TextStyle(color: Color(0xFFa02e49), fontSize: 12),
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xFFa02e49),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/user.png',
                        width: 40,
                      ),
                      title: Text(
                        'ACCOUNT DETAILS',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFa02e49)),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AccountDetailsPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'OTHERS',
                      style: TextStyle(color: Color(0xFFa02e49), fontSize: 12),
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xFFa02e49),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/printer.png',
                        width: 40,
                      ),
                      title: Text(
                        'CONNECT TO PRINTER',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFa02e49)),
                      ),
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => OrdersPage(),
                        //   ),
                        // );
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/subscribe.png',
                        width: 40,
                      ),
                      title: Text(
                        'SUBSCRIBED',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFa02e49)),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SubscribePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Divider(), // Add a divider between the main items and Logout
            ListTile(
              leading: Image.asset(
                'assets/images/switch.png',
                width: 40,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                await _auth.signOut();
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MyApp(homeScreen: LoginPage()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DialogContent extends StatefulWidget {
  const DialogContent({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  _DialogContentState createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  // final currentUser = FirebaseAuth.instance;
  bool _isLoading = true;
  bool donesending = false;
  bool _sending = false;
  bool _syncing = false;
  bool _syncing2 = false;
  bool _syncing3 = false;
  bool _syncing4 = false;

  bool _isdone = false;
  bool _isdone2 = false;
  bool _isdone3 = false;
  bool _isdone4 = false;

  String type = '';

  @override
  void initState() {
    super.initState();
    // _startTimer();
  }

  void _startTimer() {
    print(type);
    if (mounted) {
      setState(() {
        _sending = true;
        _syncing = true;
      });
    }

    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _syncing = false;
          _isdone = true;
          _syncing2 = true;
        });
      }
    });

    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _syncing2 = false;
          _isdone2 = true;
          _syncing3 = true;
        });
      }
    });

    Future.delayed(Duration(seconds: 8), () {
      if (mounted) {
        setState(() {
          _syncing3 = false;
          _isdone3 = true;
          _syncing4 = true;
        });
      }
    });

    Future.delayed(Duration(seconds: 15), () {
      if (mounted) {
        setState(() {
          _syncing4 = false;
          _isdone4 = true;
          donesending = true;
          _sending = false;

          print('done $type');
          print(DateTime.now());

          // FirebaseFirestore.instance
          //     .collection('userSynced')
          //     .doc(currentUser.currentUser?.uid)
          //     .collection('sync')
          //     .add({'type': type, 'date': DateTime.now()}).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Successfully $type Data to Server"),
            ),
          );
          // Navigator.of(context).pop();
          // }).catchError((e) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text("Something went wrong error in $e"),
          //     ),
          //   );
          // });
        });
      }
    });
  }

  Color maincolor = Color(0xFFa02e49);
  @override
  Widget build(BuildContext context) {
    if (mounted) {
      setState(() {
        type = widget.type;
      });
    }

    print(type);
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          border: Border.all(
        width: 2,
        color: maincolor,
      )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    type,
                    style: TextStyle(
                        color: maincolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    ' DATA TO SERVER',
                    style: TextStyle(
                        color: maincolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Orders',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: maincolor,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _syncing
                        ? Text(
                            'Syncing...',
                            style: TextStyle(color: Colors.red),
                          )
                        : (_isdone
                            ? Text(
                                'Done',
                                style: TextStyle(color: Colors.green),
                              )
                            : Text(
                                'Waiting...',
                                style: TextStyle(color: Colors.grey),
                              )),
                    // Text(
                    //   _isLoading
                    //       ? 'Waiting...'
                    //       : _syncing
                    //           ? 'Syncing...'
                    //           : 'Done!',
                    //   style: TextStyle(color: Colors.grey),
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      _isdone
                          ? Icons.backup_outlined
                          : Icons.settings_backup_restore,
                      color: _isdone ? Colors.green : Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Expenses',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: maincolor,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _syncing2
                        ? Text(
                            'Syncing...',
                            style: TextStyle(color: Colors.red),
                          )
                        : (_isdone2
                            ? Text(
                                'Done',
                                style: TextStyle(color: Colors.green),
                              )
                            : Text(
                                'Waiting...',
                                style: TextStyle(color: Colors.grey),
                              )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      _isdone2
                          ? Icons.backup_outlined
                          : Icons.settings_backup_restore,
                      color: _isdone2 ? Colors.green : Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Inventory',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: maincolor,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _syncing3
                        ? Text(
                            'Syncing...',
                            style: TextStyle(color: Colors.red),
                          )
                        : (_isdone3
                            ? Text(
                                'Done',
                                style: TextStyle(color: Colors.green),
                              )
                            : Text(
                                'Waiting...',
                                style: TextStyle(color: Colors.grey),
                              )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      _isdone3
                          ? Icons.backup_outlined
                          : Icons.settings_backup_restore,
                      color: _isdone3 ? Colors.green : Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: maincolor,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _syncing4
                        ? Text(
                            'Syncing...',
                            style: TextStyle(color: Colors.red),
                          )
                        : (_isdone4
                            ? Text(
                                'Done',
                                style: TextStyle(color: Colors.green),
                              )
                            : Text(
                                'Waiting...',
                                style: TextStyle(color: Colors.grey),
                              )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      _isdone4
                          ? Icons.backup_outlined
                          : Icons.settings_backup_restore,
                      color: _isdone4 ? Colors.green : Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // TextButton(
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //     child: Text(
              //       'Cancel',
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     )),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(maincolor)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel')),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(maincolor)),
                onPressed: () {
                  if (donesending != true) {
                    _startTimer();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.backup),
                    SizedBox(
                      width: 5,
                    ),
                    Text(_sending
                        ? 'Sending...'
                        : (donesending ? 'Done' : 'Continue')),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
