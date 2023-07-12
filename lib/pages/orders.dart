import 'package:flutter/material.dart';
import 'package:user/pages/home.dart';
import 'package:user/pages/pos.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<bool> isSelected = [true, false, false];
  double totalprice = 0.0;
  List<List<dynamic>> menu = [
    [
      'table 1',
      'receipt1',
      'pending',
      [
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 2',
      'receipt2',
      'onprocess',
      [
        ['tapsilogsdfd', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 3',
      'receipt3',
      'ready',
      [
        [
          'tapsilog',
          3,
          100,
          [
            ['addon1', 1, 15],
            ['addon2', 2, 15]
          ]
        ],
      ]
    ],
    [
      'table 4',
      'receipt4',
      'pending',
      [
        ['hamsilog', 1, 150],
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 5',
      'receipt5',
      'onprocess',
      [
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 6',
      'receipt6',
      'ready',
      [
        [
          'hamsilog',
          3,
          150,
          [
            ['addon1', 1, 20],
            ['addon2', 2, 20]
          ]
        ],
      ]
    ],
    [
      'table 7',
      'receipt7',
      'pending',
      [
        ['tocilog', 1, 120],
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 8',
      'receipt8',
      'onprocess',
      [
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 9',
      'receipt9',
      'ready',
      [
        [
          'tocilog',
          3,
          120,
          [
            ['addon1', 1, 25],
            ['addon2', 2, 25]
          ]
        ],
      ]
    ],
    [
      'table 1',
      'receipt1',
      'pending',
      [
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 2',
      'receipt2',
      'onprocess',
      [
        ['tapsilogsdfd', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 3',
      'receipt3',
      'ready',
      [
        [
          'tapsilog',
          3,
          100,
          [
            ['addon1', 1, 15],
            ['addon2', 2, 15]
          ]
        ],
      ]
    ],
    [
      'table 4',
      'receipt4',
      'pending',
      [
        ['hamsilog', 1, 150],
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 5',
      'receipt5',
      'onprocess',
      [
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 6',
      'receipt6',
      'ready',
      [
        [
          'hamsilog',
          3,
          150,
          [
            ['addon1', 1, 20],
            ['addon2', 2, 20]
          ]
        ],
      ]
    ],
    [
      'table 7',
      'receipt7',
      'pending',
      [
        ['tocilog', 1, 120],
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 8',
      'receipt8',
      'onprocess',
      [
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 9',
      'receipt9',
      'ready',
      [
        [
          'tocilog',
          3,
          120,
          [
            ['addon1', 1, 25],
            ['addon2', 2, 25]
          ]
        ],
      ]
    ],
    [
      'table 1',
      'receipt1',
      'pending',
      [
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 2',
      'receipt2',
      'onprocess',
      [
        ['tapsilogsdfd', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 3',
      'receipt3',
      'ready',
      [
        [
          'tapsilog',
          3,
          100,
          [
            ['addon1', 1, 15],
            ['addon2', 2, 15]
          ]
        ],
      ]
    ],
    [
      'table 4',
      'receipt4',
      'pending',
      [
        ['hamsilog', 1, 150],
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 5',
      'receipt5',
      'onprocess',
      [
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 6',
      'receipt6',
      'ready',
      [
        [
          'hamsilog',
          3,
          150,
          [
            ['addon1', 1, 20],
            ['addon2', 2, 20]
          ]
        ],
      ]
    ],
    [
      'table 7',
      'receipt7',
      'pending',
      [
        ['tocilog', 1, 120],
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 8',
      'receipt8',
      'onprocess',
      [
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 9',
      'receipt9',
      'ready',
      [
        [
          'tocilog',
          3,
          120,
          [
            ['addon1', 1, 25],
            ['addon2', 2, 25]
          ]
        ],
      ]
    ],
    [
      'table 1',
      'receipt1',
      'pending',
      [
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 2',
      'receipt2',
      'onprocess',
      [
        ['tapsilogsdfd', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 3',
      'receipt3',
      'ready',
      [
        [
          'tapsilog',
          3,
          100,
          [
            ['addon1', 1, 15],
            ['addon2', 2, 15]
          ]
        ],
      ]
    ],
    [
      'table 4',
      'receipt4',
      'pending',
      [
        ['hamsilog', 1, 150],
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 5',
      'receipt5',
      'onprocess',
      [
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 6',
      'receipt6',
      'ready',
      [
        [
          'hamsilog',
          3,
          150,
          [
            ['addon1', 1, 20],
            ['addon2', 2, 20]
          ]
        ],
      ]
    ],
    [
      'table 7',
      'receipt7',
      'pending',
      [
        ['tocilog', 1, 120],
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 8',
      'receipt8',
      'onprocess',
      [
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 9',
      'receipt9',
      'ready',
      [
        [
          'tocilog',
          3,
          120,
          [
            ['addon1', 1, 25],
            ['addon2', 2, 25]
          ]
        ],
      ]
    ],
    [
      'table 1',
      'receipt1',
      'pending',
      [
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 2',
      'receipt2',
      'onprocess',
      [
        ['tapsilogsdfd', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 3',
      'receipt3',
      'ready',
      [
        [
          'tapsilog',
          3,
          100,
          [
            ['addon1', 1, 15],
            ['addon2', 2, 15]
          ]
        ],
      ]
    ],
    [
      'table 4',
      'receipt4',
      'pending',
      [
        ['hamsilog', 1, 150],
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 5',
      'receipt5',
      'onprocess',
      [
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 6',
      'receipt6',
      'ready',
      [
        [
          'hamsilog',
          3,
          150,
          [
            ['addon1', 1, 20],
            ['addon2', 2, 20]
          ]
        ],
      ]
    ],
    [
      'table 7',
      'receipt7',
      'pending',
      [
        ['tocilog', 1, 120],
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 8',
      'receipt8',
      'onprocess',
      [
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 9',
      'receipt9',
      'ready',
      [
        [
          'tocilog',
          3,
          120,
          [
            ['addon1', 1, 25],
            ['addon2', 2, 25]
          ]
        ],
      ]
    ],
    [
      'table 1',
      'receipt1',
      'pending',
      [
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 2',
      'receipt2',
      'onprocess',
      [
        ['tapsilogsdfd', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 3',
      'receipt3',
      'ready',
      [
        [
          'tapsilog',
          3,
          100,
          [
            ['addon1', 1, 15],
            ['addon2', 2, 15]
          ]
        ],
      ]
    ],
    [
      'table 4',
      'receipt4',
      'pending',
      [
        ['hamsilog', 1, 150],
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 5',
      'receipt5',
      'onprocess',
      [
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 6',
      'receipt6',
      'ready',
      [
        [
          'hamsilog',
          3,
          150,
          [
            ['addon1', 1, 20],
            ['addon2', 2, 20]
          ]
        ],
      ]
    ],
    [
      'table 7',
      'receipt7',
      'pending',
      [
        ['tocilog', 1, 120],
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 8',
      'receipt8',
      'onprocess',
      [
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 9',
      'receipt9',
      'ready',
      [
        [
          'tocilog',
          3,
          120,
          [
            ['addon1', 1, 25],
            ['addon2', 2, 25]
          ]
        ],
      ]
    ],
    [
      'table 1',
      'receipt1',
      'pending',
      [
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 2',
      'receipt2',
      'onprocess',
      [
        ['tapsilogsdfd', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 3',
      'receipt3',
      'ready',
      [
        [
          'tapsilog',
          3,
          100,
          [
            ['addon1', 1, 15],
            ['addon2', 2, 15]
          ]
        ],
      ]
    ],
    [
      'table 4',
      'receipt4',
      'pending',
      [
        ['hamsilog', 1, 150],
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 5',
      'receipt5',
      'onprocess',
      [
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 6',
      'receipt6',
      'ready',
      [
        [
          'hamsilog',
          3,
          150,
          [
            ['addon1', 1, 20],
            ['addon2', 2, 20]
          ]
        ],
      ]
    ],
    [
      'table 7',
      'receipt7',
      'pending',
      [
        ['tocilog', 1, 120],
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 8',
      'receipt8',
      'onprocess',
      [
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 9',
      'receipt9',
      'ready',
      [
        [
          'tocilog',
          3,
          120,
          [
            ['addon1', 1, 25],
            ['addon2', 2, 25]
          ]
        ],
      ]
    ],
    [
      'table 1',
      'receipt1',
      'pending',
      [
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
        ['tapsilog', 1, 100],
        ['tapsilog', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 2',
      'receipt2',
      'onprocess',
      [
        ['tapsilogsdfd', 2, 100],
        ['tapsilog', 3, 100],
      ]
    ],
    [
      'table 3',
      'receipt3',
      'ready',
      [
        [
          'tapsilog',
          3,
          100,
          [
            ['addon1', 1, 15],
            ['addon2', 2, 15]
          ]
        ],
      ]
    ],
    [
      'table 4',
      'receipt4',
      'pending',
      [
        ['hamsilog', 1, 150],
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 5',
      'receipt5',
      'onprocess',
      [
        ['hamsilog', 2, 150],
        ['hamsilog', 3, 150],
      ]
    ],
    [
      'table 6',
      'receipt6',
      'ready',
      [
        [
          'hamsilog',
          3,
          150,
          [
            ['addon1', 1, 20],
            ['addon2', 2, 20]
          ]
        ],
      ]
    ],
    [
      'table 7',
      'receipt7',
      'pending',
      [
        ['tocilog', 1, 120],
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 8',
      'receipt8',
      'onprocess',
      [
        ['tocilog', 2, 120],
        ['tocilog', 3, 120],
      ]
    ],
    [
      'table 9',
      'receipt9',
      'ready',
      [
        [
          'tocilog',
          3,
          120,
          [
            ['addon1', 1, 25],
            ['addon2', 2, 25]
          ]
        ],
      ]
    ],
  ];
  String selectedStatus = 'pending';
  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> filteredMenu =
        menu.where((item) => item[2] == selectedStatus).toList();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        backgroundColor: Color(0xFFa02e49),
        title: Text('ORDERS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      isSelected: isSelected,
                      onPressed: (int index) {
                        setState(() {
                          if (index == 0) {
                            selectedStatus = 'pending';
                          }
                          if (index == 1) {
                            selectedStatus = 'onprocess';
                          }
                          if (index == 2) {
                            selectedStatus = 'ready';
                          }

                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = (i == index);
                          }
                        });
                      },
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'PENDING',
                            style: TextStyle(
                              color: isSelected[0]
                                  ? Colors.white
                                  : Color(0xFFa02e49),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'ON PROCESS',
                            style: TextStyle(
                              color: isSelected[1]
                                  ? Colors.white
                                  : Color(0xFFa02e49),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'READY',
                            style: TextStyle(
                              color: isSelected[2]
                                  ? Colors.white
                                  : Color(0xFFa02e49),
                            ),
                          ),
                        ),
                      ],
                      color: Colors.white,
                      selectedColor: Colors.white,
                      fillColor: Color(0xFFa02e49),
                      borderColor: Color(0xFFa02e49),
                      selectedBorderColor: Color(0xFFa02e49),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: filteredMenu.length,
                    itemBuilder: (context, index) {
                      totalprice = 0.0;
                      return _buildMenuItem(filteredMenu[index]);
                    },
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFa02e49))),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PosPage(),
                              ),
                            );
                          },
                          child: Text('NEW ENTRY')),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(List<dynamic> item) {
    String table = item[0];
    String receipt = item[1];
    String status = item[2];
    List<List<dynamic>> orders = item[3];

    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: status == selectedStatus ? Color(0xFFa02e49) : Colors.white,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            table,
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFFa02e49),
                fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFa02e49)),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    receipt,
                    style: TextStyle(fontSize: 12, color: Color(0xFFa02e49)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('ITEM/S'),
              Text('QTY'),
              Text('PRICE'),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            child: SingleChildScrollView(
              child: Column(
                children: orders.map<Widget>((order) {
                  String orderName = order[0];
                  int quantity = order[1];
                  double price = double.parse(order[2].toString());
                  List<List<dynamic>> addons = order.length > 3 ? order[3] : [];
                  totalprice += price * quantity;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.11,
                            child: Text(
                              orderName.length > 8
                                  ? orderName.substring(0, 6) + '...'
                                  : orderName,
                              style: TextStyle(
                                  fontSize: 11, color: Color(0xFFa02e49)),
                              softWrap: true,
                            ),
                          ),
                          Text(
                            '$quantity',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFFa02e49)),
                          ),
                          Text(
                            '₱$price',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFFa02e49)),
                          ),
                        ],
                      ),
                      if (addons.isNotEmpty) ..._buildAddonList(addons),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          Divider(thickness: 2, color: Color(0xFFa02e49)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFFa02e49)),
                ),
                Text('$totalprice',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFa02e49)))
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildAddonList(List<List<dynamic>> addons) {
    return addons.map<Widget>((addon) {
      String addonName = addon[0];
      int addonQuantity = addon[1];
      double addonPrice = double.parse(addon[2].toString());
      totalprice += addonPrice * addonQuantity;
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                addonName.length > 8
                    ? addonName.substring(0, 6) + '...'
                    : addonName,
                style: TextStyle(fontSize: 11),
              ),
              Text(
                ' $addonQuantity',
                style: TextStyle(fontSize: 11),
              ),
              Text(
                '$addonPrice',
                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
        ],
      );
    }).toList();
  }
}
