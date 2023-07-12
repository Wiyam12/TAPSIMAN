import 'package:flutter/material.dart';

class InventoryDetailsPage extends StatefulWidget {
  const InventoryDetailsPage({super.key, required this.productGroup});

  final String productGroup;

  @override
  State<InventoryDetailsPage> createState() => _InventoryDetailsPageState();
}

class _InventoryDetailsPageState extends State<InventoryDetailsPage> {
  String stocksRadio = 'ADD';
  List<List<dynamic>> menu = [
    [
      'TAPSILOG',
      'RICE MEALS',
      50,
      100,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'BANGSILOG',
      'RICE MEALS',
      50,
      100,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'TOCILOG',
      'RICE MEALS',
      50,
      100,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'COKE',
      'DRINKS',
      50,
      100,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'SPRITE',
      'DRINKS',
      50,
      100,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'TAPSILOG',
      'RICE MEALS',
      50,
      100,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'BANGSILOG',
      'RICE MEALS',
      50,
      100,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'TOCILOG',
      'RICE MEALS',
      50,
      100,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'COKE',
      'DRINKS',
      50,
      100,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'SPRITE',
      'DRINKS',
      50,
      100,
      AssetImage('assets/images/ambot.png'),
    ],
  ];
  String search = '';
  // filtermenu(String? search) {
  //   String productGroup = widget.productGroup;
  //   setState(() {
  //     List<List<dynamic>> filteredMenu = menu
  //         .where((item) => (item[1] == productGroup && item[0] == search))
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    String productGroup = widget.productGroup;
    List<List<dynamic>> filteredMenu = menu
        .where((item) => search == ''
            ? item[1] == productGroup
            : (item[1] == productGroup && item[0].contains(search)))
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('$productGroup'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
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
                      setState(() {
                        search = value.toUpperCase();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text(
                      'INVENTORY NAME',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFa02e49),
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text(
                      'COST',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFa02e49),
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text(
                      'STOCK#',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFa02e49),
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                )
              ],
            ),
            Divider(
              thickness: 1,
              color: Color(0xFFa02e49),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                itemCount: filteredMenu.length,
                itemBuilder: (context, index) {
                  String itemName = filteredMenu[index][0];
                  double cost = double.parse(filteredMenu[index][2].toString());
                  double stocks =
                      double.parse(filteredMenu[index][3].toString());

                  return Row(
                    children: <Widget>[
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            '$itemName',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFa02e49),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            '$cost',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFa02e49),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            '$stocks',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFa02e49),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: ((context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '$itemName',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFFa02e49),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                    Divider(
                                                      thickness: 2,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'PRODCUCT PRICING AND COSTING DATABASE',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFa02e49),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            height: 40,
                                                            child:
                                                                TextFormField(
                                                              // key: _keyList[index],
                                                              initialValue:
                                                                  '$cost',
                                                              onChanged:
                                                                  (value) {
                                                                // setState(() {
                                                                //   _textFields1[index] = value;
                                                                // });
                                                              },
                                                              decoration:
                                                                  InputDecoration(
                                                                // labelText: 'Text ${index + 1}',
                                                                label: Text(
                                                                    'PRICE'),
                                                                labelStyle: TextStyle(
                                                                    color: Color(
                                                                        0xFFa02e49)),
                                                                border:
                                                                    OutlineInputBorder(),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                              ),
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return 'Please enter a value';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          child: SizedBox(
                                                            height: 40,
                                                            child:
                                                                TextFormField(
                                                              // key: _keyList[index],
                                                              initialValue:
                                                                  '$cost',
                                                              onChanged:
                                                                  (value) {
                                                                // setState(() {
                                                                //   _textFields1[index] = value;
                                                                // });
                                                              },
                                                              decoration:
                                                                  InputDecoration(
                                                                // labelText: 'Text ${index + 1}',
                                                                label: Text(
                                                                    'COST'),
                                                                labelStyle: TextStyle(
                                                                    color: Color(
                                                                        0xFFa02e49)),
                                                                border:
                                                                    OutlineInputBorder(),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                              ),
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return 'Please enter a value';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'CURRENT STOCKS',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFFa02e49)),
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 21,
                                                              child: Radio(
                                                                  fillColor: MaterialStateProperty.resolveWith<
                                                                      Color>((Set<
                                                                          MaterialState>
                                                                      states) {
                                                                    if (states.contains(
                                                                        MaterialState
                                                                            .disabled)) {
                                                                      return Color(
                                                                          0xFFa02e49);
                                                                    }
                                                                    return Color(
                                                                        0xFFa02e49);
                                                                  }),
                                                                  value: 'ADD',
                                                                  groupValue:
                                                                      stocksRadio,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      stocksRadio =
                                                                          value!;
                                                                    });
                                                                  }),
                                                            ),
                                                            Text('ADD'),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            SizedBox(
                                                              width: 21,
                                                              child: Radio(
                                                                  fillColor: MaterialStateProperty.resolveWith<
                                                                      Color>((Set<
                                                                          MaterialState>
                                                                      states) {
                                                                    if (states.contains(
                                                                        MaterialState
                                                                            .disabled)) {
                                                                      return Color(
                                                                          0xFFa02e49);
                                                                    }
                                                                    return Color(
                                                                        0xFFa02e49);
                                                                  }),
                                                                  value:
                                                                      'REMOVE',
                                                                  groupValue:
                                                                      stocksRadio,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      stocksRadio =
                                                                          value!;
                                                                    });
                                                                  }),
                                                            ),
                                                            Text(
                                                              'REMOVE',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFa02e49),
                                                                  fontSize: 12),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            height: 40,
                                                            child:
                                                                TextFormField(
                                                              // key: _keyList[index],
                                                              initialValue:
                                                                  '$stocks',
                                                              onChanged:
                                                                  (value) {
                                                                // setState(() {
                                                                //   _textFields1[index] = value;
                                                                // });
                                                              },
                                                              decoration:
                                                                  InputDecoration(
                                                                // labelText: 'Text ${index + 1}',

                                                                border:
                                                                    OutlineInputBorder(),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Color(
                                                                          0xFFa02e49),
                                                                      width:
                                                                          2.0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                              ),
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return 'Please enter a value';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty.all<
                                                                            Color>(
                                                                        Color(
                                                                            0xFFa02e49))),
                                                            onPressed: () {
                                                              // if (_formKeyNotes.currentState!
                                                              //     .validate()) {
                                                              //   print(_textFieldsNotes);

                                                              //   setState(() {
                                                              //     NoteList = _textFieldsNotes;
                                                              //     showNotes = false;
                                                              //   });
                                                              //   checkNoteList();
                                                              //   print(NoteList);
                                                              // }
                                                            },
                                                            child:
                                                                Text('CANCEL')),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty.all<
                                                                            Color>(
                                                                        Color(
                                                                            0xFFa02e49))),
                                                            onPressed: () {
                                                              // if (_formKeyNotes.currentState!
                                                              //     .validate()) {
                                                              //   print(_textFieldsNotes);

                                                              //   setState(() {
                                                              //     NoteList = _textFieldsNotes;
                                                              //     showNotes = false;
                                                              //   });
                                                              //   checkNoteList();
                                                              //   print(NoteList);
                                                              // }
                                                            },
                                                            child: Text(
                                                                '$stocksRadio')),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                    }));
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Color(0xFFa02e49),
                              )))
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
