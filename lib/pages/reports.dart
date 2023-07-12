import 'dart:math';

import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:user/pages/salessummary.dart';
import 'package:user/pages/stockinsights.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<String> _dropdownItems = ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];
  String _selectedItem = 'DAILY';
  List ranking = [
    {'class': 'Monday', 'total': 23},
    {'class': 'Tuesday', 'total': 14},
    {'class': 'Wednesday', 'total': 8},
    {'class': 'Thursday', 'total': 7},
    {'class': 'Friday', 'total': 21},
    {'class': 'Saturday', 'total': 21},
    {'class': 'Sunday', 'total': 21},
  ];
  @override
  void dispose() {
    // Stop the running process when leaving the page

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('REPORTS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                        label: Text('Transaction Count'),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
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
                        label: Text('AVG Basket Size'),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
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
                        label: Text('Cost of Product Sold'),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
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
                        label: Text('MARGIN'),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
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
                        label: Text('AVG Basket Size'),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
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
                        label: Text('Cost of Product Sold'),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SALES PERFORMANCE',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFa02e49)),
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
                height: 5,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Color(0xFFa02e49).withOpacity(0.2),
                    border: Border.all(width: 2, color: Color(0xFFa02e49))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: DChartBarCustom(
                        // loadingDuration: const Duration(milliseconds: 1500),
                        showLoading: true,
                        valueAlign: Alignment.topCenter,
                        showDomainLine: true,
                        showDomainLabel: true,
                        showMeasureLine: true,
                        showMeasureLabel: true,
                        spaceDomainLabeltoChart: 10,
                        spaceMeasureLabeltoChart: 5,
                        spaceDomainLinetoChart: 15,
                        spaceMeasureLinetoChart: 20,
                        spaceBetweenItem: 16,
                        measureLabelStyle: TextStyle(
                            fontSize: 9,
                            color: Color(0xFFa02e49),
                            fontWeight: FontWeight.bold),
                        domainLabelStyle: TextStyle(
                            fontSize: 9,
                            color: Color(0xFFa02e49),
                            fontWeight: FontWeight.bold),
                        listData:
                            // mounted ?
                            List.generate(ranking.length, (index) {
                          Color currentColor =
                              Color((Random().nextDouble() * 0xFFFFFF).toInt());
                          return DChartBarDataCustom(
                            onTap: () {
                              print(
                                '${ranking[index]['class']} => ${ranking[index]['total']}',
                              );
                            },
                            value: ranking[index]['total'].toDouble(),
                            label: ranking[index]['class'],
                            color: currentColor.withOpacity(1),
                          );
                        })
                        //     :
                        // [
                        //   DChartBarDataCustom(
                        //     value: 13,
                        //     label: 'Jan',
                        //     color: Colors.blue,
                        //   ),
                        //   DChartBarDataCustom(value: 20, label: 'Feb'),
                        //   DChartBarDataCustom(value: 30, label: 'Mar'),
                        //   DChartBarDataCustom(value: 40, label: 'Apr'),
                        //   DChartBarDataCustom(value: 25, label: 'Mei'),
                        // ]
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFa02e49))),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => StockInsightsPage(),
                            ),
                          );
                        },
                        child: Text('STOCKS INSIGHTS')),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFa02e49))),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SalesSummaryPage(),
                            ),
                          );
                        },
                        child: Text('SALES SUMMARY')),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFa02e49))),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'SALES REPORT',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFa02e49)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 40,
                                                child: TextFormField(
                                                  // key: _keyList[index],
                                                  // initialValue: '${_textFields1[index]}',
                                                  onChanged: (value) {
                                                    // setState(() {
                                                    //   _textFields1[index] = value;
                                                    // });
                                                  },
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  style: TextStyle(
                                                      color: Color(0xFFa02e49)),
                                                  decoration: InputDecoration(
                                                    // labelText: 'Text ${index + 1}',
                                                    label: Text('Enter Email'),
                                                    labelStyle: TextStyle(
                                                        color:
                                                            Color(0xFFa02e49)),

                                                    border:
                                                        OutlineInputBorder(),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFa02e49),
                                                          width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFa02e49),
                                                          width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFa02e49),
                                                          width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFa02e49),
                                                          width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please enter a value';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          Color(0xFFa02e49)),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('CANCEL')),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          Color(0xFFa02e49)),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('EXPORT')),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text('EXPORT REPORT')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
