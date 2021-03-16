import 'package:flutter/material.dart';
import 'package:fake_iom/api.dart';
import 'package:fake_iom/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.amber,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // home: MyHomePage(title: 'IoM DEMO Login Page'),
      home: LoginPage(),
    );
  }
}

// main
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          "Welcom to IoM",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: Center(
        child: Column(
          children: [
            FlutterLogo(size: 450),
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: Text("ACCOUNT:"),
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // labelText: 'Enter Account Here',
                      hintText: 'Enter Account Here',
                    ),
                  ),
                ),
                Container(
                  width: 100,
                ),
              ],
            ),
            Container(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: Text("PASSWORD: "),
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password Here',
                    ),
                  ),
                ),
                Container(
                  width: 100,
                ),
              ],
            ),
            Container(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   width: 100,
                //   height: 50,
                // ),
                RaisedButton(
                  onPressed: () {
                    var data = login('root', 'minnotec123');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage(
                        loginData: data,
                      );
                    }));
                  },
                  textColor: Colors.white,
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
