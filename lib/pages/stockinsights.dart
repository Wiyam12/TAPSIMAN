import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StockInsightsPage extends StatefulWidget {
  const StockInsightsPage({super.key});

  @override
  State<StockInsightsPage> createState() => _StockInsightsPageState();
}

class _StockInsightsPageState extends State<StockInsightsPage> {
  Color maincolor = Color(0xFFa02e49);
  DateTime today = DateTime.now();
  final dateFormat = DateFormat('dd MMMM - yyyy');
  List<String> _dropdownItems = ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];
  String _selectedItem = 'DAILY';

  String getStartDateText() {
    if (_selectedItem == 'DAILY') {
      DateTime yesterday = today.subtract(Duration(days: 1));
      print(yesterday);
      setState(() {
        _selectedItem = 'DAILY';
      });
      return '${dateFormat.format(yesterday)}';
    } else if (_selectedItem == 'WEEKLY') {
      DateTime lastWeek = today.subtract(Duration(days: 7));
      print(lastWeek);
      setState(() {
        _selectedItem = 'WEEKLY';
      });
      return '${dateFormat.format(lastWeek)}';
    } else if (_selectedItem == 'MONTHLY') {
      DateTime lastMonth = DateTime(today.year, today.month - 1, today.day);
      print(lastMonth);
      setState(() {
        _selectedItem = 'MONTHLY';
      });

      return '${dateFormat.format(lastMonth)}';
    } else if (_selectedItem == 'YEARLY') {
      DateTime lastYear = DateTime(today.year - 1, today.month, today.day);
      print(lastYear);
      setState(() {
        _selectedItem = 'YEARLY';
      });
      return '${dateFormat.format(lastYear)}';
    } else {
      return 'Start Date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text('STOCK INSIGHTS'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: '0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFFa02e49),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    // labelText: 'Text ${index + 1}',
                    label: Text('INVENTORY PRICE'),
                    labelStyle:
                        TextStyle(color: Color(0xFFa02e49), fontSize: 12),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  initialValue: '0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFFa02e49),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    // labelText: 'Text ${index + 1}',
                    label: Text('INVENTORY COST'),
                    labelStyle:
                        TextStyle(color: Color(0xFFa02e49), fontSize: 12),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  initialValue: '0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFFa02e49),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    // labelText: 'Text ${index + 1}',
                    label: Text('POTENTIAL SALES MARGIN'),
                    labelStyle:
                        TextStyle(color: Color(0xFFa02e49), fontSize: 12),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(thickness: 2, color: maincolor),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFFa02e49))),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 2, color: Color(0xFFa02e49)))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              getStartDateText(),
                              style: TextStyle(color: Color(0xFFa02e49)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        dateFormat.format(today),
                        style: TextStyle(color: Color(0xFFa02e49)),
                        textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Row(
                children: [
                  Text(
                    'Filter: ',
                    style: TextStyle(color: Color(0xFFa02e49)),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFFa02e49)),
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: DropdownButton(
                        iconSize: 12,
                        iconEnabledColor: Color(0xFFa02e49),
                        underline: Container(),
                        value: _selectedItem,
                        items: _dropdownItems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFFa02e49)),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue!;
                          });
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'TOP MOVING PRODUCTS',
                style: TextStyle(color: maincolor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration:
                BoxDecoration(border: Border.all(color: maincolor, width: 1)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            'PRODUCT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: maincolor,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.17,
                        child: Text(
                          'QTY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: maincolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.17,
                        child: Text(
                          'PRICE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: maincolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.17,
                        child: Text(
                          'COST',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: maincolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.17,
                        child: Text(
                          'MARGIN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: maincolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: maincolor,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Text(
                                  'Tapsilog',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: maincolor,
                                  ),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.17,
                              child: Text(
                                '5',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: maincolor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.17,
                              child: Text(
                                '450',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: maincolor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.17,
                              child: Text(
                                '250',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: maincolor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.17,
                              child: Text(
                                '250',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: maincolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    '   TOTAL',
                    style: TextStyle(
                        color: maincolor, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    '5',
                    style: TextStyle(
                        color: maincolor, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'GROSS MARGIN: 250.0',
                      style: TextStyle(
                          color: maincolor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'NET MARGIN: 250.0',
                      style: TextStyle(
                          color: maincolor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      )),
    );
  }
}
