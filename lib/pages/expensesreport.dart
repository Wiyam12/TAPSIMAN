import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesReport extends StatefulWidget {
  const ExpensesReport({super.key});

  @override
  State<ExpensesReport> createState() => _ExpensesReportState();
}

class _ExpensesReportState extends State<ExpensesReport> {
  String _selectedItem = 'DAILY';
  double grandtotal = 0.0;
  int totalentry = 0;
  DateTime today = DateTime.now();
  final dateFormat = DateFormat('dd MMMM - yyyy');
  List<String> _dropdownItems = ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];

  String getStartDateText() {
    if (_selectedItem == 'DAILY') {
      DateTime yesterday = today.subtract(Duration(days: 1));
      print(yesterday);
      setState(() {
        totalentry = 0;
        _selectedItem = 'DAILY';
        containsdate = [];
      });
      return '${dateFormat.format(yesterday)}';
    } else if (_selectedItem == 'WEEKLY') {
      DateTime lastWeek = today.subtract(Duration(days: 7));
      print(lastWeek);
      setState(() {
        totalentry = 0;
        _selectedItem = 'WEEKLY';
        containsdate = [];
      });
      return '${dateFormat.format(lastWeek)}';
    } else if (_selectedItem == 'MONTHLY') {
      DateTime lastMonth = DateTime(today.year, today.month - 1, today.day);
      print(lastMonth);
      setState(() {
        totalentry = 0;
        _selectedItem = 'MONTHLY';
        containsdate = [];
      });

      return '${dateFormat.format(lastMonth)}';
    } else if (_selectedItem == 'YEARLY') {
      DateTime lastYear = DateTime(today.year - 1, today.month, today.day);
      print(lastYear);
      setState(() {
        totalentry = 0;
        _selectedItem = 'YEARLY';
        containsdate = [];
      });
      return '${dateFormat.format(lastYear)}';
    } else {
      return 'Start Date';
    }
  }

  List<List<dynamic>> filteredExpenses = [];
  List<dynamic> containsdate = [];

  Map<String, List<dynamic>> filteredExpensesMap = {};
  List<List<dynamic>> expenses = [
    ['GAasdasdhaskhdjkshdjsahdjS', '2023-06-02 00:00:00.000', 1000.0],
    ['GAS', '2023-06-09 00:00:00.000', 1000.0],
    ['GAS', '2023-06-02 00:00:00.000', 1000.0],
    ['GAS', '2023-05-19 00:00:00.000', 1000.0],
    ['GAS', '2023-05-18 00:00:00.000', 1000.0],
    ['GAS', '2023-05-17 00:00:00.000', 1000.0],
    ['GAS', '2023-05-17 00:00:00.000', 1000.0],
    ['GAS', '2023-05-20 00:00:00.000', 1000.0],
  ];

  List<List<dynamic>> getFilteredExpenses() {
    List<List<dynamic>> filteredExpenses = [];

    if (_selectedItem == 'DAILY') {
      filteredExpenses = expenses.where((expense) {
        DateTime expenseDate = DateTime.parse(expense[1]);
        return expenseDate
                .isAfter(DateTime.now().subtract(Duration(days: 1))) &&
            expenseDate.isBefore(DateTime.now().add(Duration(days: 1)));
      }).toList();
    } else if (_selectedItem == 'WEEKLY') {
      filteredExpenses = expenses.where((expense) {
        DateTime expenseDate = DateTime.parse(expense[1]);
        return expenseDate
                .isAfter(DateTime.now().subtract(Duration(days: 7))) &&
            expenseDate.isBefore(DateTime.now().add(Duration(days: 1)));
      }).toList();
    } else if (_selectedItem == 'MONTHLY') {
      filteredExpenses = expenses.where((expense) {
        DateTime expenseDate = DateTime.parse(expense[1]);
        return expenseDate
                .isAfter(DateTime.now().subtract(Duration(days: 30))) &&
            expenseDate.isBefore(DateTime.now().add(Duration(days: 1)));
      }).toList();
    } else if (_selectedItem == 'YEARLY') {
      filteredExpenses = expenses.where((expense) {
        DateTime expenseDate = DateTime.parse(expense[1]);
        return expenseDate
                .isAfter(DateTime.now().subtract(Duration(days: 365))) &&
            expenseDate.isBefore(DateTime.now().add(Duration(days: 1)));
      }).toList();
    }
    // print(filteredExpenses);

    Map<String, List<dynamic>> filteredExpensesMap = {};
    for (List<dynamic> expense in filteredExpenses) {
      String date = expense[1];
      int totalEntry = 1;
      double totalAmount = expense[2];

      if (filteredExpensesMap.containsKey(date)) {
        List<dynamic> existingEntry = filteredExpensesMap[date]!;
        totalEntry++;
        totalAmount += existingEntry[2];
      }

      filteredExpensesMap[date] = [date, totalEntry, totalAmount];
    }

    List<List<dynamic>> filteredExpensess =
        filteredExpensesMap.values.toList().cast<List<dynamic>>();
    print('filteredExpenses: $filteredExpensess');
    return filteredExpensess;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('EXPENSES REPORT'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Color(0xFFa02e49))),
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
                            border:
                                Border.all(width: 1, color: Color(0xFFa02e49)),
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
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        'DATE',
                        style: TextStyle(
                            color: Color(0xFFa02e49),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text('ENTRY',
                          style: TextStyle(
                              color: Color(0xFFa02e49),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text('AMOUNT',
                          style: TextStyle(
                              color: Color(0xFFa02e49),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center))
                ],
              ),
              Divider(
                thickness: 2,
                color: Color(0xFFa02e49),
              ),
              // Row(
              //   children: [
              //     SizedBox(
              //         width: MediaQuery.of(context).size.width * 0.3,
              //         child: Text(
              //           'DATE',
              //           style: TextStyle(
              //             color: Color(0xFFa02e49),
              //           ),
              //           textAlign: TextAlign.center,
              //         )),
              //     SizedBox(
              //         width: MediaQuery.of(context).size.width * 0.3,
              //         child: Text('ENTRY',
              //             style: TextStyle(
              //               color: Color(0xFFa02e49),
              //             ),
              //             textAlign: TextAlign.center)),
              //     SizedBox(
              //         width: MediaQuery.of(context).size.width * 0.3,
              //         child: Text('AMOUNT',
              //             style: TextStyle(
              //               color: Color(0xFFa02e49),
              //             ),
              //             textAlign: TextAlign.center))
              //   ],
              // ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: getFilteredExpenses().length,
                    itemBuilder: (context, index) {
                      List<dynamic> expense = getFilteredExpenses()[index];
                      String date = expense[0];
                      int entry = expense[1];
                      double totalamount = expense[2];
                      totalentry += entry;
                      grandtotal += totalamount;

                      return Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Text(
                                    DateFormat('MMMM dd, yyyy')
                                        .format(DateTime.parse(date)),
                                    style: TextStyle(
                                      color: Color(0xFFa02e49),
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Text('$entry',
                                      style: TextStyle(
                                        color: Color(0xFFa02e49),
                                      ),
                                      textAlign: TextAlign.center)),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Text('₱$totalamount',
                                      style: TextStyle(
                                        color: Color(0xFFa02e49),
                                      ),
                                      textAlign: TextAlign.center))
                            ],
                          ),
                          if (index + 1 == getFilteredExpenses().length)
                            Column(
                              children: [
                                Divider(
                                  thickness: 2,
                                  color: Color(0xFFa02e49),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Text(
                                          'OVERALL ENTRIES',
                                          style: TextStyle(
                                              color: Color(0xFFa02e49),
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Text('$totalentry',
                                            style: TextStyle(
                                                color: Color(0xFFa02e49),
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: Text('₱$grandtotal',
                                            style: TextStyle(
                                                color: Color(0xFFa02e49),
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))
                                  ],
                                )
                              ],
                            )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
