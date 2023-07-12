import 'package:flutter/material.dart';
import 'package:user/customer/pages/flipcard.dart';

import 'vouchers.dart';

class PlayAndWinPage extends StatefulWidget {
  const PlayAndWinPage({super.key});

  @override
  State<PlayAndWinPage> createState() => _PlayAndWinPageState();
}

class _PlayAndWinPageState extends State<PlayAndWinPage> {
  Color maincolor = Color(0xFFa02e49);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: maincolor,
        title: Text('Play & Win'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VouchersPage(),
                  ),
                );
              },
              icon: Icon(Icons.confirmation_num))
        ],
      ),
      body: Center(
          child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FLipCardPage(),
            ),
          );
        },
        child: Container(
          color: maincolor,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color(0xFFc96f6f),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 70, horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/logo.png',
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      'Flip a card once a week to win vouchers or free meals and use it on your next order!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FLipCardPage(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFc96f6f)),
                ),
                child: Text(
                  'Play',
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
