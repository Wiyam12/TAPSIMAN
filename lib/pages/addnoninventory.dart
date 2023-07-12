import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:user/pages/pos.dart';

class AddNonInventory extends StatefulWidget {
  const AddNonInventory({super.key});

  @override
  State<AddNonInventory> createState() => _AddNonInventoryState();
}

class _AddNonInventoryState extends State<AddNonInventory> {
  final _orders = Hive.box('_orders');
  List<Map<String, dynamic>> _items = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController _productNamecontroller = TextEditingController();
  TextEditingController _productPricecontroller = TextEditingController();
  TextEditingController _productCostcontroller = TextEditingController();

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

  Future<void> _addOrder(Map<String, dynamic> newItem) async {
    await _orders.add(newItem);
    // final data = _orders.keys.map((key) {
    //   final item = _orders.get(key);
    //   return {
    //     "productName": item["productName"],
    //     "productPrice": item['productPrice'],
    //     "quantity": item['quantity'],
    //     "note": item['note']
    //   };
    // }).toList();

    // setState(() {
    //   _items = data.reversed.toList();
    // });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PosPage(),
      ),
    );
    // print(_items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PosPage(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        title: Text('ADD NON-INVENTORY ITEM'),
        backgroundColor: Color(0xFFa02e49),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _productNamecontroller,
                      style: TextStyle(color: Color(0xFFa02e49)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'PRODUCT NAME',
                        hintStyle: TextStyle(color: Color(0xFFa02e49)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
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
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _productPricecontroller,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Color(0xFFa02e49)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'PRICE',
                        hintStyle: TextStyle(color: Color(0xFFa02e49)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
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
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _productCostcontroller,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Color(0xFFa02e49)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'COST',
                        hintStyle: TextStyle(color: Color(0xFFa02e49)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(decrementQuantity);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: Color(0xFFa02e49)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: Color(0xFFa02e49)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '$quantity',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(incrementQuantity);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: Color(0xFFa02e49)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.add),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFa02e49))),
                          onPressed: () {},
                          child: Text('CANCEL')),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFa02e49))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _addOrder({
                                "productName": _productNamecontroller.text,
                                "productPrice":
                                    double.parse(_productPricecontroller.text),
                                "quantity": quantity,
                                "note": ''
                              });
                            }
                          },
                          child: Text('CONFIRM')),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
