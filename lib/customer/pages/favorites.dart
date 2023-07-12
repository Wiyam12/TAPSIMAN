import 'package:flutter/material.dart';

import 'cart.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool first = true;
  List<String> buttonLabels = [
    'Tapsi',
    'Beverages',
  ];
  int selectedIndex = 0;

  List<List<dynamic>> menu = [
    [
      'Product 1',
      'Price 1',
      '15-20 minutes',
      AssetImage('images/ambot.png'),
      true
    ],
    [
      'Product 2',
      'Price 2',
      '10-15 minutes',
      AssetImage('images/ambot.png'),
      false
    ],

    // ['Product 3', 'Price 3', 'Details 3', AssetImage('images/ambot.png')],
  ];
  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      buttonLabels.insert(0, 'All');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        elevation: 0.0,
        title: Text('Favorite'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Container(
        color: Color(0xFFa02e49),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
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
                  Color textColor = isSelected ? Colors.white : Colors.black;

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(backgroundColor),
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
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  String productName = menu[index][0];
                  String price = menu[index][1];
                  String details = menu[index][2];
                  AssetImage image = menu[index][3];
                  bool available = menu[index][4];

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: available
                        ? Container(
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
                          )
                        : Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 100,
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
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            Colors.grey, BlendMode.saturation),
                                        child: Image(
                                          image: image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Not Available',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
