import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user/customer/pages/storespage.dart';

import 'package:user/customer/pages/vouchers.dart';
import 'package:user/login.dart';
import 'package:user/main.dart';

import '../pages/account.dart';
import '../pages/cart.dart';
import '../pages/favorites.dart';
import '../pages/orders.dart';
import '../pages/playandwin.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({super.key});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Juan Dela Cruz',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                'juandelacruz@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(color: Color(0xFFd298a6)),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Image.asset(
                      'images/icons/user.png',
                      width: 50,
                    ),
                    title: Text(
                      'Account',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AccountPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'images/icons/coins.png',
                      width: 50,
                    ),
                    title: Text(
                      'Play & Win',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PlayAndWinPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'images/icons/voucher.png',
                      width: 50,
                    ),
                    title: Text(
                      'Vouchers',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VouchersPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'images/icons/touch.png',
                      width: 50,
                    ),
                    title: Text(
                      'Favorites',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FavoritesPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'images/icons/completed-task.png',
                      width: 50,
                    ),
                    title: Text(
                      'My Orders',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OrdersPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'images/icons/trolley.png',
                      width: 50,
                    ),
                    title: Text(
                      'Cart',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'images/icons/store.png',
                      width: 50,
                    ),
                    title: Text(
                      'Store',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => StorePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Divider(), // Add a divider between the main items and Logout
            ListTile(
              leading: Image.asset(
                'images/icons/switch.png',
                width: 40,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                await _auth.signOut();
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MyApp(homeScreen: LoginPage()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
