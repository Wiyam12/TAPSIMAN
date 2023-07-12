import 'dart:math';

import 'package:flutter/material.dart';
import 'package:user/components/sidebar.dart';
import 'package:user/pages/expenses.dart';
import 'package:user/pages/inventorylist.dart';
import 'package:user/pages/orders.dart';
import 'package:user/pages/pos.dart';
import 'package:user/pages/products.dart';
import 'package:user/pages/reports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: -1,
            child: Column(
              children: [
                Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage('assets/images/bubble.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('Need help?'),
                    ))),
                GestureDetector(
                  onTap: () async {
                    print('ambottt');
                    // _startConversation();
                  },
                  child: SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 33.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/ambot.png'),
                        radius: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 167, 42, 34),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'TAPSIMAN POS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/menu-bar.png',
              width: 30,
            ),
          ),
        ),
      ),
      drawer: SideNavBar(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.36,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.9),
                image: DecorationImage(
                  image: AssetImage('assets/images/posbg.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Good Morning, Welcome!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //   child: TextField(
                  //     style: TextStyle(color: Colors.white),
                  //     decoration: InputDecoration(
                  //       filled: true,
                  //       fillColor: Colors.white.withOpacity(0.5),
                  //       contentPadding: EdgeInsets.symmetric(
                  //         vertical: 8.0,
                  //         horizontal: 16.0,
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(color: Colors.white, width: 2.0),
                  //         borderRadius: BorderRadius.circular(30.0),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(color: Colors.white, width: 2.0),
                  //         borderRadius: BorderRadius.circular(30.0),
                  //       ),
                  //       hintText: 'Search',
                  //       hintStyle: TextStyle(color: Colors.white),
                  //       prefixIcon: Icon(Icons.search, color: Colors.white),
                  //       prefixIconConstraints: BoxConstraints(minWidth: 40),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFa02e49),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height *
                  0.67, // Remaining 2/3 of the screen height

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PosPage(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.point_of_sale,
                                    size:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xFFa02e49),
                                  ),
                                ),
                                Text(
                                  'POS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFa02e49),
                                  ),
                                  textScaleFactor:
                                      ScaleSize.textScaleFactor(context),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => OrderPage(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.shopping_basket,
                                    size:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xFFa02e49),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    'ORDERS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFa02e49),
                                    ),
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ExpensesPage(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.money,
                                    size:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xFFa02e49),
                                  ),
                                ),
                                Text(
                                  'EXPENSES',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFa02e49),
                                  ),
                                  textScaleFactor:
                                      ScaleSize.textScaleFactor(context),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => InventoryListPage(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.inventory_outlined,
                                    size:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xFFa02e49),
                                  ),
                                ),
                                Text(
                                  'INVENTORY',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFa02e49),
                                  ),
                                  textScaleFactor:
                                      ScaleSize.textScaleFactor(context),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    size:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xFFa02e49),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    'PRODUCTS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFa02e49),
                                    ),
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ReportsPage(),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.bar_chart,
                                    size:
                                        MediaQuery.of(context).size.width * 0.2,
                                    color: Color(0xFFa02e49),
                                  ),
                                ),
                                Text(
                                  'Reports',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFa02e49),
                                  ),
                                  textScaleFactor:
                                      ScaleSize.textScaleFactor(context),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 100,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //       height: 50, width: double.infinity, color: Colors.black),
          // ),
        ],
      ),
    );
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
