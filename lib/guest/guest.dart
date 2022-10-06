// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:settyl/LoginPage.dart';
import 'package:settyl/map/guestmap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuestDashboard extends StatefulWidget {
  const GuestDashboard({Key? key}) : super(key: key);

  @override
  State<GuestDashboard> createState() => _GuestDashboardState();
}

class _GuestDashboardState extends State<GuestDashboard> {
  String? username = "Guest";
  String? usermail = "guest123@gmail.com";
  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    //prefs.setString('username', username!);
    //prefs.setString('fullname', fullname!);
    //Navigator.pushReplacement(
    //    context, MaterialPageRoute(builder: (context) => Signin()));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color(0xffF3AB0D),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: _logOut) //go to welcome screen
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text('$username'), accountEmail: Text('$usermail')),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => GuestDashboard()));
            },
          ),
          SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()));
            },
          ),
        ],
      )),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Hai, welcome $username",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 100.0),
                    Divider(
                      color: Colors.purple,
                      thickness: 5.0,
                      height: 25.0,
                    ),
                    ElevatedButton(
                        onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Guest User'),
                                content:
                                    const Text('Guest User not Able to Edit'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              ),
                            ),
                        child: const Text('Edit')),
                    SizedBox(height: 10.0),
                    Divider(
                      color: Colors.purple,
                      thickness: 5.0,
                      height: 25.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GuestMap(),
                              ));
                        },
                        child: const Text('Map')),
                    SizedBox(height: 10.0),
                    Divider(
                      color: Colors.purple,
                      thickness: 5.0,
                      height: 25.0,
                    ),
                    //Text('click here to start'),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => const MyAppPut()));
                    //     },
                    //     child: Text('click me'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
