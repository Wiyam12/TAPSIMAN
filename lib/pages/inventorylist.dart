import 'package:flutter/material.dart';
import 'package:user/pages/inventorydetails.dart';

class InventoryListPage extends StatefulWidget {
  const InventoryListPage({super.key});

  @override
  State<InventoryListPage> createState() => _InventoryListPageState();
}

class _InventoryListPageState extends State<InventoryListPage> {
  List<List<dynamic>> menu = [
    [
      'TAPSILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'BANGSILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'TOCILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'COKE',
      'DRINKS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'SPRITE',
      'DRINKS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'TAPSILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'BANGSILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'TOCILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'COKE',
      'DRINKS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'SPRITE',
      'DRINKS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    List<String> productGroups =
        menu.map((item) => item[1].toString()).toSet().toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('INVENTORY LIST'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: productGroups.length,
                itemBuilder: (context, index) {
                  String productGroup = productGroups[index];

                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => InventoryDetailsPage(
                                    productGroup: productGroup),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              productGroup,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFFa02e49),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Color(0xFFa02e49),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
