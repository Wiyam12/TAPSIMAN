import 'package:flutter/material.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key, required this.orderid});
  final String orderid;
  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  List<List<dynamic>> menu = [
    [
      'Friday',
      'June 2, 2023',
      'Order Number',
      'Receipt Number',
      580,
      4,
      '0001',
      [
        [
          'Tapsilog',
          4,
          50,
          [
            ['addon1', 1, 10],
            ['addon2', 2, 15]
          ]
        ],
        [
          'Examplesdasdafxcasdfsds',
          1,
          100,
          [
            ['addon1', 1, 10],
            ['addon2', 1, 5]
          ]
        ],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
        ['Example', 3, 120, []],
      ],
    ],
  ];

  @override
  Widget build(BuildContext context) {
    String orderid = widget.orderid;
    double totalAmount = 0.0;
    double addontotalAmount = 0.0;

    for (var item in menu) {
      for (var subItem in item[7]) {
        double price = double.parse(subItem[2].toString());
        int quantity = subItem[1];
        totalAmount += price * quantity;
      }
    }
    double calculateAddonTotal(List<dynamic> menu) {
      double total = 0.0;
      List<dynamic> addons = menu[7];

      for (var item in addons) {
        if (item.length > 3) {
          List<dynamic> subAddons = item[3];
          for (var subItem in subAddons) {
            total += subItem[1] * subItem[2];
          }
        }
      }

      return total;
    }

    double addonTotal = calculateAddonTotal(menu[0]);
    print('Addon Total: $addonTotal');

    totalAmount += addonTotal;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFa02e49),
        title: Text('${menu[0][1]}'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xFFa02e49),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          for (var item in menu)
                            Column(
                              children: [
                                Text('${item[2]}'),
                                Text('${item[3]}'),
                                Column(
                                  children: [
                                    for (var subItem in item[7])
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  child: Flexible(
                                                    child: Text(
                                                      subItem[0].length > 12
                                                          ? '${subItem[0].substring(0, 12)}...'
                                                          : subItem[0],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            subItem[0].length >
                                                                    8
                                                                ? 14
                                                                : 25,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'QTY: ${subItem[1]}',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                Text(
                                                  '₱${subItem[2]}',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (subItem[3].length >
                                              0) // Check if addons exist
                                            Column(
                                              children: [
                                                for (var addon in subItem[3])
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 100,
                                                        child: Flexible(
                                                          child: Text(
                                                            '${addon[0]}',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  addon[0].length >
                                                                          15
                                                                      ? 14
                                                                      : 20,
                                                            ),
                                                            softWrap: true,
                                                          ),
                                                        ),
                                                      ),
                                                      // - Quantity: ${addon[1]}, Price: ${addon[2]}
                                                      Text('QTY: ${addon[1]}'),
                                                      Text('₱ ${addon[2]}')
                                                    ],
                                                  ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('               ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30)),
                                        Text('TOTAL'),
                                        Text(
                                          '₱ $totalAmount',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.pinkAccent,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
