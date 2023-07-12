import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SalesSummaryPage extends StatefulWidget {
  const SalesSummaryPage({super.key});

  @override
  State<SalesSummaryPage> createState() => _SalesSummaryPageState();
}

class _SalesSummaryPageState extends State<SalesSummaryPage> {
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
        title: Text('SALES SUMMARY'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    style: TextStyle(color: Color(0xFFa02e49)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFa02e49).withOpacity(0.1),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFa02e49), width: 2.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFa02e49), width: 2.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Color(0xFFa02e49)),
                      prefixIcon: Icon(Icons.search, color: Color(0xFFa02e49)),
                      prefixIconConstraints: BoxConstraints(minWidth: 40),
                    ),
                    onChanged: (value) {
                      // String upperValue = value.toUpperCase();
                      // setState(() {
                      //   search = value.toUpperCase();
                      // });
                    },
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
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Text(
                          'DATE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: maincolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Text(
                          'TOTAL SALES',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: maincolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Text(
                          'TOTAL PROFIT',
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
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: Text(
                                '06-02-2023',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: maincolor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: Text(
                                '635.0',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: maincolor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: Text(
                                '585.0',
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
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Text(
                  'TOTAL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: maincolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Text(
                  '635.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: maincolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Text(
                  '585.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: maincolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ]),
      )),
    );
  }
}
