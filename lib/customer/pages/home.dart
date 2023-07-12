import 'package:flutter/material.dart';
import 'package:user/customer/pages/addorder.dart';

import '../components/navbar.dart';

class HomePageCustomer extends StatefulWidget {
  const HomePageCustomer({super.key, required this.storename});
  final String storename;
  @override
  State<HomePageCustomer> createState() => _HomePageCustomerState();
}

class _HomePageCustomerState extends State<HomePageCustomer> {
  bool first = true;
  String username = 'Juan Dela Cruz';
  List<String> buttonLabels = ['TAPSI', 'BEVERAGES', 'ADD ON'];
  List<List<dynamic>> menu = [
    [
      'TAPSILOG',
      '80',
      'TAPSI',
      '15-20 minutes',
      AssetImage('assets/images/POS-tapsilog.jpg')
    ],
    [
      'BANGSILOG',
      '80',
      'TAPSI',
      '15-20 minutes',
      AssetImage('assets/images/POS-bangsilog.jpg')
    ],
    [
      'CHICKSILOG',
      '80',
      'TAPSI',
      '15-20 minutes',
      AssetImage('assets/images/POS-chicksilog.jpg')
    ],
    [
      'CORNSILOG',
      '80',
      'TAPSI',
      '15-20 minutes',
      AssetImage('assets/images/POS-cornsilog.jpg')
    ],
    [
      'HOTSILOG',
      '80',
      'TAPSI',
      '15-20 minutes',
      AssetImage('assets/images/POS-hotsilog.jpg')
    ],
    [
      'LECHONSILOG',
      '80',
      'TAPSI',
      '15-20 minutes',
      AssetImage('assets/images/POS-lechonsilog.jpg')
    ],
    [
      'LONGSILOG',
      '80',
      'TAPSI',
      '15-20 minutes',
      AssetImage('assets/images/POS-longsilog.jpg')
    ],
    [
      'SPAMSILOG',
      '80',
      'TAPSI',
      '15-20 minutes',
      AssetImage('assets/images/POS-spamsilog.jpg')
    ],
    [
      'TOCILOG',
      '80',
      'TAPSI',
      '15-20 minutes',
      AssetImage('assets/images/POS-tocilog.jpg')
    ],
    [
      'COKE',
      '80',
      'BEVERAGES',
      '15-20 minutes',
      AssetImage('assets/images/cokecan.jpg')
    ],
    [
      'SPRITE',
      '80',
      'BEVERAGES',
      '15-20 minutes',
      AssetImage('assets/images/spritecan.jpg')
    ],
    [
      'RICE',
      '80',
      'ADD ON',
      '15-20 minutes',
      AssetImage('assets/images/rice.jpg')
    ],
    [
      'TAPA',
      '80',
      'ADD ON',
      '15-20 minutes',
      AssetImage('assets/images/tapa.jpg')
    ],
    [
      'HOTDOG',
      '80',
      'ADD ON',
      '15-20 minutes',
      AssetImage('assets/images/hot.jpg')
    ],

    // ['Product 3', 'Price 3', 'Details 3', AssetImage('images/ambot.png')],
  ];
  // Labels for the buttons
  int selectedIndex = 0; // Track the index of the selected button
  String search = '';
  String selectedGroup = 'TAPSI';
  @override
  Widget build(BuildContext context) {
    String storename = widget.storename;
    if (first) {
      first = false;
      buttonLabels.insert(0, 'All');
    }

    List<List<dynamic>> filteredMenu = menu
        .where((item) => search != ''
            ? item[0].contains(search)
            : (selectedGroup == 'All' || item[2] == selectedGroup))
        .toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFa02e49),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Hello $username,',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 207, 207, 207)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: SideNavBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFa02e49),
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Welcome to $storename!',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Color(0xFFb8a3a8)),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Color(0xFFbc8390),
                    hintStyle: TextStyle(color: Color(0xFFb8a3a8)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    // String upperValue = value.toUpperCase();
                    setState(() {
                      search = value.toUpperCase();
                    });
                  },
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  height: 40.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: buttonLabels.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;
                      Color backgroundColor =
                          isSelected ? Colors.black : Colors.white;
                      Color textColor =
                          isSelected ? Colors.white : Colors.black;

                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedGroup = buttonLabels[index];
                              selectedIndex = index;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                backgroundColor),
                          ),
                          child: Text(
                            buttonLabels[index],
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: filteredMenu.length,
                    itemBuilder: (context, index) {
                      String productName = filteredMenu[index][0];
                      String price = filteredMenu[index][1];
                      String details = filteredMenu[index][3];
                      AssetImage image = filteredMenu[index][4];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddOrder(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$productName',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          color: Colors.grey[300],
                                        ),
                                        Text('$details',
                                            style: TextStyle(
                                                color: Colors.grey[400])),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '₱ $price',
                                              style: TextStyle(
                                                  color: Colors.pinkAccent,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: Icon(Icons.add))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
