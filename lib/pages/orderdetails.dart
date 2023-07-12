import 'package:flutter/material.dart';
import 'package:user/pages/revieworderdetails.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _NameController = new TextEditingController();
  final _tablenumberController = new TextEditingController();
  final _noteController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('DETAILS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFa02e49),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "CUSTOMER'S DETAILS AND NOTES",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _NameController,
                    style: TextStyle(color: Color(0xFFa02e49)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'NAME',
                      hintStyle: TextStyle(color: Color(0xFFa02e49)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                        return 'Please input Customer Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _tablenumberController,
                    style: TextStyle(color: Color(0xFFa02e49)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'TABLE NUMBER',
                      hintStyle: TextStyle(color: Color(0xFFa02e49)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                        return 'Please input Table Number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _noteController,
                    style: TextStyle(color: Color(0xFFa02e49)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'NOTES',
                      hintStyle: TextStyle(color: Color(0xFFa02e49)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'P';
                    //   }
                    //   return null;
                    // },
                  ),
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
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ReviewOrderDetails(
                                      name: _NameController.text,
                                      tablenumber: int.parse(
                                          _tablenumberController.text),
                                      note: _noteController.text),
                                ),
                              );
                            }
                          },
                          child: Text('NEXT')),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
