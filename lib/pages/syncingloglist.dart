import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SyncingLogListPage extends StatefulWidget {
  const SyncingLogListPage({super.key});

  @override
  State<SyncingLogListPage> createState() => _SyncingLogListPageState();
}

class _SyncingLogListPageState extends State<SyncingLogListPage> {
  Color maincolor = Color(0xFFa02e49);

  String _selectedItem = 'DAILY';
  DateTime today = DateTime.now();
  final dateFormat = DateFormat('dd MMMM - yyyy');
  List<String> _dropdownItems = ['DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY'];

  List<List<dynamic>> synclogs = [
    ['Success get data', '2023-06-02 00:00:00.000'],
    ['Success get data', '2023-05-02 00:00:00.000'],
    ['Success get data', '2023-05-28 00:00:00.000'],
    ['Success send data', '2023-05-12 00:00:00.000'],
    ['Success send data', '2023-03-02 00:00:00.000'],
  ];

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

  List<List<dynamic>> getFilteredsynclogs() {
    List<List<dynamic>> filteredsynclogs = [];

    if (_selectedItem == 'DAILY') {
      filteredsynclogs = synclogs.where((synclog) {
        DateTime synclogDate = DateTime.parse(synclog[1]);
        return synclogDate
                .isAfter(DateTime.now().subtract(Duration(days: 1))) &&
            synclogDate.isBefore(DateTime.now().add(Duration(days: 1)));
      }).toList();
    } else if (_selectedItem == 'WEEKLY') {
      filteredsynclogs = synclogs.where((synclog) {
        DateTime synclogDate = DateTime.parse(synclog[1]);
        return synclogDate
                .isAfter(DateTime.now().subtract(Duration(days: 7))) &&
            synclogDate.isBefore(DateTime.now().add(Duration(days: 1)));
      }).toList();
    } else if (_selectedItem == 'MONTHLY') {
      filteredsynclogs = synclogs.where((synclog) {
        DateTime synclogDate = DateTime.parse(synclog[1]);
        return synclogDate
                .isAfter(DateTime.now().subtract(Duration(days: 30))) &&
            synclogDate.isBefore(DateTime.now().add(Duration(days: 1)));
      }).toList();
    } else if (_selectedItem == 'YEARLY') {
      filteredsynclogs = synclogs.where((synclog) {
        DateTime synclogDate = DateTime.parse(synclog[1]);
        return synclogDate
                .isAfter(DateTime.now().subtract(Duration(days: 365))) &&
            synclogDate.isBefore(DateTime.now().add(Duration(days: 1)));
      }).toList();
    }
    // print(filteredsynclogs);

    // Map<String, List<dynamic>> filteredsynclogsMap = {};
    // for (List<dynamic> synclog in filteredsynclogs) {
    //   String date = synclog[1];
    //   int totalEntry = 1;
    //   double totalAmount = synclog[2];

    //   if (filteredsynclogsMap.containsKey(date)) {
    //     List<dynamic> existingEntry = filteredsynclogsMap[date]!;
    //     totalEntry++;
    //     totalAmount += existingEntry[2];
    //   }

    //   filteredsynclogsMap[date] = [date, totalEntry, totalAmount];
    // }

    // List<List<dynamic>> filteredsynclogss =
    //     filteredsynclogsMap.values.toList().cast<List<dynamic>>();
    // print('filteredsynclogs: $filteredsynclogss');
    return filteredsynclogs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SYNCING LOG LIST'),
        elevation: 0,
        backgroundColor: maincolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'DATA LIST',
                    style: TextStyle(
                        color: maincolor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'DATE',
                    style: TextStyle(
                        color: maincolor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: maincolor,
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: getFilteredsynclogs().length,
                  itemBuilder: (context, index) {
                    List<dynamic> synclog = getFilteredsynclogs()[index];
                    String date = synclog[1];
                    String name = synclog[0];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: maincolor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('MMMM dd, yyyy')
                                .format(DateTime.parse(date)),
                            style: TextStyle(
                                color: maincolor, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
