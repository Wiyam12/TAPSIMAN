import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user/pages/products.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({
    super.key,
    required this.imagelink,
    required this.productgroup,
    required this.productname,
    required this.productprice,
    required this.productcost,
    required this.productstocks,
    required this.isnotavailable,
  });
  final String imagelink;
  final String productgroup;
  final String productname;
  final double productprice;
  final double productcost;
  final int productstocks;
  final bool isnotavailable;
  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _formKeyAddons = GlobalKey<FormState>();
  final _formKeyProduct = GlobalKey<FormState>();
  final _formKeyNotes = GlobalKey<FormState>();
  File? _selectedImage;
  String? imagelink;
  int radioAddons = 0;
  int radioNotes = 0;
  bool notAvailable = false;

  TextEditingController _productGroupcontroller = TextEditingController();
  TextEditingController _productNamecontroller = TextEditingController();
  TextEditingController _productPricecontroller = TextEditingController();
  TextEditingController _productCostcontroller = TextEditingController();
  TextEditingController _productStockscontroller = TextEditingController();

  List<List<dynamic>> addonList = [];
  List<dynamic> NoteList = [];
  checkaddonList() {
    if (addonList.length > 0) {
      setState(() {
        radioAddons = 1;
      });
    } else {
      setState(() {
        radioAddons = 0;
      });
    }
  }

  checkNoteList() {
    if (NoteList.length > 0) {
      setState(() {
        radioNotes = 1;
      });
    } else {
      setState(() {
        radioNotes = 0;
      });
    }
  }

  // for addons
  List<String> _textFields1 = [''];
  List<String> _textFields2 = [''];
  List<String> _textFields3 = [''];
  List<GlobalKey> _keyList = [GlobalKey()];
  List<GlobalKey> _keyList2 = [GlobalKey()];
  List<GlobalKey> _keyList3 = [GlobalKey()];

  // end addons

  // for notes
  List<String> _textFieldsNotes = [''];
  List<GlobalKey> _keyListNotes = [GlobalKey()];
  // end notes

  // image picker
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  // end image picker
  @override
  void initState() {
    super.initState();
    imagelink = widget.imagelink;
    _productGroupcontroller.text = widget.productgroup;
    _productNamecontroller.text = widget.productname;
    _productPricecontroller.text = widget.productprice.toString();
    _productCostcontroller.text = widget.productcost.toString();
    _productStockscontroller.text = widget.productstocks.toString();
    notAvailable = widget.isnotavailable;
    // _productGroupcontroller = TextEditingController(text: widget.productgroup);
  }

  @override
  Widget build(BuildContext context) {
    checkaddonList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('EDIT PRODUCT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKeyProduct,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: double.infinity,
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3, color: Color(0xFFa02e49)),
                                  borderRadius: BorderRadius.circular(20),

                                  // image: DecorationImage(

                                  //     image:AssetImage(

                                  //         'assets/images/photo.png'),
                                  //     fit: BoxFit.cover),
                                ),
                                child: _selectedImage != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.file(
                                          _selectedImage!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Image.network(imagelink!),
                                // Image(
                                //     image: imagelink!,
                                //     fit: BoxFit.cover,
                                //   ),
                                // Image.asset(
                                //     imagelink,
                                //     fit: BoxFit.cover,
                                //   ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFa02e49),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: IconButton(
                                        onPressed: () {
                                          _pickImage();
                                        },
                                        icon: Icon(Icons.camera_alt_outlined,
                                            color: Colors.white))),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: TextFormField(
                                  controller: _productGroupcontroller,
                                  style: TextStyle(color: Color(0xFFa02e49)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    label: Text('PRODUCT GROUP'),
                                    labelStyle:
                                        TextStyle(color: Color(0xFFa02e49)),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    setState(() {
                                      _productGroupcontroller.text = value!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: TextFormField(
                                  controller: _productNamecontroller,
                                  style: TextStyle(color: Color(0xFFa02e49)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    label: Text('PRODUCT NAME'),
                                    labelStyle:
                                        TextStyle(color: Color(0xFFa02e49)),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFa02e49), width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onSaved: (value) {
                                    setState(() {
                                      _productNamecontroller.text = value!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(thickness: 2, color: Color(0xFFa02e49)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _productPricecontroller,
                            style: TextStyle(color: Color(0xFFa02e49)),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text('PRICE'),
                              labelStyle: TextStyle(color: Color(0xFFa02e49)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onSaved: (value) {
                              setState(() {
                                _productPricecontroller.text = value!;
                              });
                            },
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
                            controller: _productCostcontroller,
                            style: TextStyle(color: Color(0xFFa02e49)),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text('COST'),
                              labelStyle: TextStyle(color: Color(0xFFa02e49)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onSaved: (value) {
                              setState(() {
                                _productCostcontroller.text = value!;
                              });
                            },
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
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _productStockscontroller,
                            style: TextStyle(color: Color(0xFFa02e49)),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text('STOCKS'),
                              labelStyle: TextStyle(color: Color(0xFFa02e49)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFa02e49), width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onSaved: (value) {
                              setState(() {
                                _productStockscontroller.text = value!;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                Switch(
                                  value: notAvailable,
                                  activeColor: Color(0xFFa02e49),
                                  onChanged: (value) {
                                    setState(() {
                                      notAvailable = value;
                                      print(notAvailable);
                                    });
                                  },
                                ),
                                Text(
                                  'NOT AVAILABLE',
                                  style: TextStyle(
                                      color: Color(0xFFa02e49),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(thickness: 2, color: Color(0xFFa02e49)),
                    // Row(
                    //   children: [
                    //     // Row(
                    //     //   children: [Switch(value: true, onChanged: (value) {})],
                    //     // ),
                    //     Expanded(
                    //       child: Container(
                    //         child: Row(
                    //           children: [
                    //             Radio(
                    //                 fillColor: MaterialStateProperty
                    //                     .resolveWith<Color>(
                    //                         (Set<MaterialState>
                    //                             states) {
                    //                   if (states.contains(
                    //                       MaterialState.disabled)) {
                    //                     return Color(0xFFa02e49);
                    //                   }
                    //                   return Color(0xFFa02e49);
                    //                 }),
                    //                 value: 1,
                    //                 groupValue: radioAddons,
                    //                 onChanged: (value) {
                    //                   setState(() {
                    //                     showAddons = true;
                    //                     radioAddons = 0;
                    //                   });
                    //                 }),
                    //             GestureDetector(
                    //               onTap: () {
                    //                 setState(() {
                    //                   showAddons = true;
                    //                 });
                    //               },
                    //               child: Text(
                    //                 'Addons',
                    //                 style: TextStyle(
                    //                     color: Color(0xFFa02e49),
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 18),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Container(
                    //         child: Row(
                    //           children: [
                    //             Radio(
                    //                 value: 1,
                    //                 groupValue: radioNotes,
                    //                 fillColor: MaterialStateProperty
                    //                     .resolveWith<Color>(
                    //                         (Set<MaterialState>
                    //                             states) {
                    //                   if (states.contains(
                    //                       MaterialState.disabled)) {
                    //                     return Color(0xFFa02e49);
                    //                   }
                    //                   return Color(0xFFa02e49);
                    //                 }),
                    //                 onChanged: (value) {
                    //                   setState(() {
                    //                     showNotes = true;
                    //                   });
                    //                 }),
                    //             GestureDetector(
                    //               onTap: () {
                    //                 setState(() {
                    //                   showNotes = true;
                    //                 });
                    //               },
                    //               child: Text(
                    //                 'Notes',
                    //                 style: TextStyle(
                    //                     color: Color(0xFFa02e49),
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 18),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Divider(thickness: 2, color: Color(0xFFa02e49))
                  ],
                ),
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
                            if (_formKeyProduct.currentState!.validate()) {
                              if (_selectedImage == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('REQUIRED TO PUT AN IMAGE!'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('success!'),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text('SAVE')),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
