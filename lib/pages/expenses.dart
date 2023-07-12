import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user/pages/expensesreport.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<List<dynamic>> filteredexpenses = [];
  List<List<dynamic>> expenses = [
    ['GAasdasdhaskhdjkshdjsahdjS', '2023-06-20 00:00:00.000', 1000.0],
    ['GAS', '2023-06-19 00:00:00.000', 1000.0],
    ['GAS', '2023-06-20 00:00:00.000', 1000.0],
    ['GAS', '2023-06-19 00:00:00.000', 1000.0],
    ['GAS', '2023-06-18 00:00:00.000', 1000.0],
    ['GAS', '2023-06-17 00:00:00.000', 1000.0],
    ['GAS', '2023-06-17 00:00:00.000', 1000.0],
    ['GAS', '2023-06-20 00:00:00.000', 1000.0],
  ];
  double calculateTotal() {
    double total = 0.0;
    if (selectedDate == null) {
      for (var expense in expenses) {
        total += expense[2];
      }
    } else {
      for (var expense in filteredexpenses) {
        total += expense[2];
      }
    }

    return total;
  }

  DateTime? selectedDate;
  final DateFormat _dateFormat = DateFormat('MMM dd, yyyy');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      filterExpenses(pickedDate);
      setState(() {
        print(pickedDate);
        selectedDate = pickedDate;
      });
    }
  }

  String _formatDate(DateTime? date) {
    return date != null ? _dateFormat.format(date) : 'SELECT DATE';
  }

  filterExpenses(DateTime selecteddate) {
    print('selecteddate: $selecteddate');

    setState(() {
      filteredexpenses =
          expenses.where((item) => item[1] == selecteddate.toString()).toList();
      print(filteredexpenses);
    });
    print(filteredexpenses.length);
  }

  refreshEntry() {
    int entry = 0;
    if (selectedDate == null) {
      entry = expenses.length;
    } else {
      entry = filteredexpenses.length;
    }

    return entry;
  }

  int listexpenseslength = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXPENSES'),
        backgroundColor: Color(0xFFa02e49),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFa02e49),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ADD EXPENSES',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: TextFormField(
                                  style: TextStyle(color: Color(0xFFa02e49)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'DETAILS',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: TextFormField(
                                  style: TextStyle(color: Color(0xFFa02e49)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'AMOUNT',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFFa02e49))),
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => PosPage(),
                                    //   ),
                                    // );
                                  },
                                  child: Text('ADD')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFFa02e49))),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Color(0xFFa02e49),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _formatDate(selectedDate),
                                    style: TextStyle(color: Color(0xFFa02e49)),
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                      color: Color(0xFFa02e49))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Entry #',
                                  style: TextStyle(color: Color(0xFFa02e49)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  '${refreshEntry()}',
                                  style: TextStyle(color: Color(0xFFa02e49)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          'DETAILS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFa02e49),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          'DATE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFa02e49),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          'AMOUNT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFa02e49),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 2, color: Color(0xFFa02e49)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: selectedDate == null
                          ? expenses.length
                          : filteredexpenses.length,
                      itemBuilder: (context, index) {
                        String name = selectedDate == null
                            ? expenses[index][0]
                            : filteredexpenses[index][0];
                        DateTime date = DateTime.parse(selectedDate == null
                            ? expenses[index][1]
                            : filteredexpenses[index][1]);
                        double amount = selectedDate == null
                            ? expenses[index][2]
                            : filteredexpenses[index][2];

                        String formattedDate =
                            DateFormat('MMM dd, yyyy').format(date);
                        if (selectedDate == null) {
                          listexpenseslength = expenses.length;
                        } else {
                          listexpenseslength = filteredexpenses.length;
                        }
                        if (index + 1 < listexpenseslength) {
                          return Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  name.length > 12
                                      ? name.substring(0, 10) + '...'
                                      : name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFFa02e49)),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  formattedDate,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFFa02e49)),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  '\₱${amount.toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFFa02e49)),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      name.length > 12
                                          ? name.substring(0, 10) + '...'
                                          : name,
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Color(0xFFa02e49)),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      formattedDate,
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Color(0xFFa02e49)),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      '\₱${amount.toStringAsFixed(2)}',
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Color(0xFFa02e49)),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(thickness: 2, color: Color(0xFFa02e49)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'TOTAL:',
                                      style: TextStyle(
                                          color: Color(0xFFa02e49),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '\₱${calculateTotal().toStringAsFixed(2)}',
                                      style: TextStyle(
                                          color: Color(0xFFa02e49),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        }
                        // ListTile(
                        //   title: Text(name),
                        //   subtitle: Text(formattedDate),
                        //   trailing: Text('\$${amount.toStringAsFixed(2)}'),
                        // );
                      },
                    ),
                  )
                ],
              ),
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
                                builder: (context) => ExpensesReport(),
                              ),
                            );
                          },
                          child: Text('VIEW EXPENSES REPORT')),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
