import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FLipCardPage extends StatefulWidget {
  const FLipCardPage({super.key});

  @override
  State<FLipCardPage> createState() => _FLipCardPageState();
}

class _FLipCardPageState extends State<FLipCardPage> {
  Color maincolor = Color(0xFFa02e49);

  // GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  List<GlobalKey<FlipCardState>> cardKey = [];
  List<bool> _cardFlips = [];
  List<String> _cardContents = [];
  List<String> _cardRewards = [];
  int _flippedCardIndex = -1;
  bool _isDisabled = false;

  @override
  void initState() {
    super.initState();
    _initializeCards();
  }

  void _initializeCards() {
    cardKey = List.generate(9, (index) => GlobalKey<FlipCardState>());
    _cardFlips = List.generate(9, (index) => false);
    _cardContents = List.generate(9, (index) => 'Click to flip');
    _cardRewards = _generateRandomRewards();
  }

  List<String> _generateRandomRewards() {
    final random = Random();
    final rewards = [
      '1 RICE',
      '10% DISCOUNT',
      '₱50 OFF',
      '1 MEAL',
      '1 SOFTDRINK',
      '50% DISCOUNT',
      '₱100 OFF',
      '1 HOTSILOG',
      '₱150 OFF',
    ];

    rewards.shuffle(random);
    return rewards;
  }

  void flipcard(int i, String reward) {
    setState(() {
      _isDisabled = true;
      _cardFlips = List.generate(9, (index) => true);
    });
  }

  void _flipCard(int index, String reward) {
    if (_isDisabled) {
      return;
    }
    setState(() {
      _isDisabled = true;
    });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      Text(
                        'Congratulations!',
                        style: TextStyle(
                            color: maincolor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Center(
                                child: Text(
                                  'You won a $reward!',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'images/reward-voucher.png',
                        width: MediaQuery.of(context).size.height * 0.2,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('PLAY & WIN'),
        backgroundColor: maincolor,
      ),
      body: Container(
        color: maincolor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.61,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FlipCard(
                          key: cardKey[index],
                          flipOnTouch: false,
                          // fill: Fill
                          //     .fillBack, // Fill the back side of the card to make in the same size as the front.
                          // direction: FlipDirection.HORIZONTAL, // default
                          // side:
                          //     CardSide.FRONT, // The side to initially display.
                          front: GestureDetector(
                            onTap: () {
                              if (!_isDisabled) {
                                cardKey[index].currentState!.toggleCard();
                                _flipCard(index, _cardRewards[index]);
                              }
                              // cardKey[index].currentState!.toggleCard();
                              // _flipCard(index, _cardRewards[index]);
                            },
                            child: Container(
                              width: 200,
                              height: 500,
                              decoration: BoxDecoration(
                                  color: Color(0xFFc96f6f),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30.0, horizontal: 10),
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
                          ),
                          back: Container(
                            width: 200,
                            height: 500,
                            decoration: BoxDecoration(
                                color: Color(0xFFc96f6f),
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30.0, horizontal: 10),
                                child: Center(
                                    child: Text(
                                  _cardRewards[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                          ),
                        )
                        //  FlipCard(
                        //   fill: Fill.fillBack,
                        //   side: CardSide.FRONT,
                        //   // flipOnTouch: true,
                        //   direction: FlipDirection.HORIZONTAL,
                        //   front:
                        //       // Card(
                        //       //   child: InkWell(
                        //       //     onTap: () => _flipCard(index, _cardRewards[index]),
                        //       //     child: Center(
                        //       //       child: Text(
                        //       //         _cardContents[index],
                        //       //         style: TextStyle(fontSize: 20.0),
                        //       //       ),
                        //       //     ),
                        //       //   ),
                        //       // ),
                        //       GestureDetector(
                        //     onTap: () {
                        //       _flipCard(index, _cardRewards[index]);
                        //     },
                        //     child: Container(
                        //       width: 200,
                        //       height: 500,
                        //       decoration: BoxDecoration(
                        //           color: Color(0xFFc96f6f),
                        //           borderRadius: BorderRadius.circular(30)),
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //             vertical: 30.0, horizontal: 10),
                        //         child: ClipRRect(
                        //           borderRadius: BorderRadius.circular(100),
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 image: DecorationImage(
                        //                   image: AssetImage(
                        //                     'images/logo.png',
                        //                   ),
                        //                 )),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   back: Card(
                        //     child:
                        //         // Center(
                        //         //   child: Text(
                        //         //     _cardRewards[index],
                        //         //     style: TextStyle(fontSize: 20.0),
                        //         //   ),
                        //         // ),
                        //         Container(
                        //             width: 200,
                        //             height: 500,
                        //             decoration: BoxDecoration(
                        //                 color: Color(0xFFc96f6f),
                        //                 borderRadius: BorderRadius.circular(30)),
                        //             child: Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                   vertical: 30.0, horizontal: 10),
                        //               child: Text(
                        //                 _cardRewards[index],
                        //                 style: TextStyle(fontSize: 20.0),
                        //               ),
                        //             )),
                        //   ),
                        // ),
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
