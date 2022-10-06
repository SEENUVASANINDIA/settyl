// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:settyl/LoginPage.dart';
import 'package:settyl/map/guestmap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? username;
  String? usermail;

  @override
  void initState() {
    super.initState();
    name();
  }

  void name() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      usermail = prefs.getString('mail');
    });
  }

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
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
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
                      "Hai, welcome $username ",
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Signin())));
                        },
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
