import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:user/pages/orderdetails.dart';
import 'package:user/pages/pos.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _orders = Hive.box('_orders');
  List<dynamic> dataArray = [];
  List<List<dynamic>> order = [
    [
      'Tapsilog',
      15,
      1,
      [
        ['addon1', 15, 1],
        ['addon2', 15, 3]
      ]
    ],
    [
      'Hotsilog',
      15,
      1,
      [
        ['addon1', 10, 1],
        ['addon2', 10, 2]
      ]
    ],
  ];

  bool last = false;

  List<List<dynamic>> addons = [];

  double grandtotal = 0.0;
  String getCurrentDateTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM dd, yyyy').format(now);
    String formattedTime = DateFormat('h:mm a').format(now);
    return '$formattedDate | $formattedTime';
  }

  double calculateTotalAmount(List<dynamic> order) {
    double totalAmount = 0.0;

    for (int i = 0; i < order.length; i++) {
      double itemPrice = order[i]['productPrice'];
      int itemQuantity = order[i]['quantity'];
      totalAmount += itemPrice * itemQuantity;
    }

    return totalAmount;
  }

  Future<void> _getOrder() async {
    for (int i = 0; i < _orders.length; i++) {
      setState(() {
        dataArray.add(_orders.getAt(i));
      });
    }
    print(dataArray);
  }

  @override
  void initState() {
    super.initState();
    _getOrder();
  }

  @override
  Widget build(BuildContext context) {
    List<DataRow> dataRows = [];

    for (var item in order) {
      List<dynamic> addons = item[3];
      bool hasAddons = addons.isNotEmpty;

      dataRows.add(
        DataRow(
          cells: [
            DataCell(Text(item[0])),
            DataCell(Text(item[1].toString())),
            DataCell(Text(item[2].toString())),
          ],
        ),
      );

      if (hasAddons) {
        dataRows.add(
          DataRow(
            cells: [
              DataCell(
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: addons.map<Widget>((addon) {
                      return Text('- ${addon[0]}: ${addon[1]} x ${addon[2]}');
                    }).toList(),
                  ),
                ),
              ),
              DataCell(Text('')),
              DataCell(Text('')),
            ],
          ),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('REVIEW'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        'PRODUCT',
                        style: TextStyle(
                            color: Color(0xFFa02e49),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        'QTY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFFa02e49),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        'PRICE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFFa02e49),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        'SUBTOTAL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFFa02e49),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 2, color: Color(0xFFa02e49)),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemCount: dataArray.length,
                    itemBuilder: (context, index) {
                      // bool hasaddons = false;

                      if (dataArray.length == index + 1) {
                        last = true;
                        print('last');
                      }
                      print(order.length);
                      print(index);

                      String productName = dataArray[index]['productName'];
                      double price = dataArray[index]['productPrice'];
                      int quantity = dataArray[index]['quantity'];
                      // if (currentOrder[3].length > 0) {
                      //   addons = currentOrder[3];
                      //   hasaddons = true;
                      // }

                      double subtotal = 0.0;
                      subtotal = price * quantity;

                      grandtotal += subtotal;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                    productName,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Color(0xFFa02e49)),
                                  )),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                    '$quantity',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0xFFa02e49)),
                                  )),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                    '₱ $price',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0xFFa02e49)),
                                  )),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                    '₱$subtotal',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0xFFa02e49)),
                                  )),
                            ],
                          ),
                          // if (hasaddons)
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     // Text('Addons:'),
                          //     ListView.builder(
                          //       shrinkWrap: true,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       itemCount: addons.length,
                          //       itemBuilder: (context, index) {
                          //         List<dynamic> currentAddon = addons[index];
                          //         String addonName = currentAddon[0];
                          //         double addonPrice = double.parse(
                          //             currentAddon[1].toString());
                          //         int addonQuantity = currentAddon[2];

                          //         double addonSubtotal = 0.0;
                          //         addonSubtotal = addonPrice * addonQuantity;

                          //         grandtotal += addonPrice * addonQuantity;
                          //         return Padding(
                          //           padding: EdgeInsets.only(left: 16.0),
                          //           child: Row(
                          //             children: [
                          //               Container(
                          //                 width: MediaQuery.of(context)
                          //                         .size
                          //                         .width *
                          //                     0.28,
                          //                 child: Text(
                          //                   '$addonName',
                          //                 ),
                          //               ),
                          //               Container(
                          //                 width: MediaQuery.of(context)
                          //                         .size
                          //                         .width *
                          //                     0.21,
                          //                 child: Text(
                          //                   '$addonQuantity',
                          //                 ),
                          //               ),
                          //               Container(
                          //                 width: MediaQuery.of(context)
                          //                         .size
                          //                         .width *
                          //                     0.17,
                          //                 child: Text(
                          //                   '₱$addonPrice',
                          //                 ),
                          //               ),
                          //               Container(
                          //                 width: MediaQuery.of(context)
                          //                         .size
                          //                         .width *
                          //                     0.19,
                          //                 child: Text(
                          //                   '₱$addonSubtotal',
                          //                   textAlign: TextAlign.center,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //   ],
                          // ),
                          Divider(thickness: 1, color: Color(0xFFa02e49)),
                          if (last)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  getCurrentDateTime(),
                                  style: TextStyle(color: Color(0xFFa02e49)),
                                ),
                                Text('GRAND TOTAL:',
                                    style: TextStyle(color: Color(0xFFa02e49))),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text(
                                      '₱${calculateTotalAmount(dataArray)}',
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Color(0xFFa02e49))),
                                ),
                              ],
                            )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFa02e49))),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PosPage(),
                                ),
                              );
                            },
                            child: Text('ADD ORDER')),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFa02e49))),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => OrderDetailsPage(),
                                ),
                              );
                            },
                            child: Text('CONFIRM')),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
