import 'package:flutter/material.dart';

import 'addorder.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<List<dynamic>> menu = [
    [
      'Product 1',
      'Price 1',
      '15-20 minutes',
      AssetImage('images/ambot.png'),
      1
    ],
    [
      'Product 2',
      'Price 2',
      '10-15 minutes',
      AssetImage('images/ambot.png'),
      4
    ],
    [
      'Product 1',
      'Price 1',
      '15-20 minutes',
      AssetImage('images/ambot.png'),
      4
    ],
    [
      'Product 1',
      'Price 1',
      '15-20 minutes',
      AssetImage('images/ambot.png'),
      4
    ],

    // ['Product 3', 'Price 3', 'Details 3', AssetImage('images/ambot.png')],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFFa02e49),
          title: Text('Cart'),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          color: Color(0xFFa02e49),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Text(
                  'Order Number',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Order Receipt',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: menu.length,
                    itemBuilder: (context, index) {
                      String productName = menu[index][0];
                      String price = menu[index][1];
                      String details = menu[index][2];
                      AssetImage image = menu[index][3];
                      int qty = menu[index][4];

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
                                            Text('QTY: $qty'),
                                            // Container(
                                            //     decoration: BoxDecoration(
                                            //       color: Colors.white,
                                            //       boxShadow: [
                                            //         BoxShadow(
                                            //           color: Colors.grey
                                            //               .withOpacity(0.5),
                                            //           spreadRadius: 2,
                                            //           blurRadius: 5,
                                            //           offset: Offset(0, 3),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //     child: Icon(Icons.add))
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFeb5135)),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Confirm Order',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            )),
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
        ));
  }
}
