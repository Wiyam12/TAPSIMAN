import 'package:flutter/material.dart';
import 'package:user/customer/pages/home.dart';

class VouchersPage extends StatefulWidget {
  const VouchersPage({super.key});

  @override
  State<VouchersPage> createState() => _VouchersPageState();
}

class _VouchersPageState extends State<VouchersPage> {
  Color maincolor = Color(0xFFa02e49);
  List<dynamic> vouchers = ['1 RICE', '10% DISCOUNT', '1 SOFTDRINK'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Voucher'),
        backgroundColor: maincolor,
        centerTitle: true,
      ),
      body: Container(
        color: maincolor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: vouchers.length,
                itemBuilder: (context, index) {
                  String vouchername = vouchers[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        vouchername,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset(
                                        'images/voucher.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomePageCustomer(
                                              storename: 'Tapsihan 1',
                                            ),
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xFFc96f6f)),
                                      ),
                                      child: Text(
                                        'use',
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
