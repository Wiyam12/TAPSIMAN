import 'package:flutter/material.dart';

import '../components/addcartanimation.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddOrder> {
  List<String> buttonLabels = [
    'Egg',
    'Tapa',
    'Rice',
  ];

  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  AddToCartButtonStateId stateId = AddToCartButtonStateId.idle;
  @override
  Widget build(BuildContext context) {
    List<bool> isSelectedList = List<bool>.filled(buttonLabels.length, false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFa02e49),
          elevation: 0.0,
          title: Text('Detail'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
          ],
        ),
        body: Container(
          color: Color(0xFFa02e49),
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Tapsilog',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage('images/ambot.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Choose Add On',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: buttonLabels.length,
                          itemBuilder: (context, index) {
                            bool isSelected = isSelectedList[index];

                            Color backgroundColor =
                                isSelected ? Colors.black : Colors.white;
                            Color textColor =
                                isSelected ? Colors.white : Colors.black;

                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isSelectedList[index] =
                                          !isSelectedList[index];
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            backgroundColor),
                                  ),
                                  child: Text(
                                    buttonLabels[index],
                                    style: TextStyle(color: textColor),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }),
                Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: Color(0xFFeeeeee),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(decrementQuantity);
                            },
                            icon: Icon(Icons.remove)),
                        Text('$quantity'),
                        IconButton(
                            onPressed: () {
                              print('$quantity');
                              setState(incrementQuantity);
                            },
                            icon: Icon(Icons.add)),
                      ],
                    )),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        Text('₱ 120',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    // SizedBox(
                    //   width: 150,
                    //   height: 50,
                    //   child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //           backgroundColor: Color(0xFFeb5135)),
                    //       onPressed: () {},
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text(
                    //           'Add to Cart',
                    //           style: TextStyle(fontWeight: FontWeight.bold),
                    //         ),
                    //       )),
                    // )
                    SizedBox(
                      width: 150,
                      child: AddToCartButton(
                        trolley: Image.asset(
                          'images/icons/ic_cart.png',
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                        text: Text(
                          'Add to cart',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                        check: SizedBox(
                          width: 48,
                          height: 48,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(24),
                        backgroundColor: Colors.deepOrangeAccent,
                        onPressed: (id) {
                          if (id == AddToCartButtonStateId.idle) {
                            //handle logic when pressed on idle state button.
                            setState(() {
                              stateId = AddToCartButtonStateId.loading;
                              Future.delayed(Duration(seconds: 3), () {
                                setState(() {
                                  print('done');
                                  stateId = AddToCartButtonStateId.done;
                                });
                              });
                            });
                          } else if (id == AddToCartButtonStateId.done) {
                            //handle logic when pressed on done state button.
                            setState(() {
                              stateId = AddToCartButtonStateId.idle;
                            });
                          }
                        },
                        stateId: stateId,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
