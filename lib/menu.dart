import 'package:flutter/material.dart';
import 'package:fake_iom/api.dart';

class HomePage extends StatefulWidget {
  HomePage({this.loginData});
  final Future<LoginResponse> loginData;

  @override
  _HomePageState createState() => _HomePageState(data: loginData);
}

class _HomePageState extends State<HomePage> {
  final Future<LoginResponse> data;

  _HomePageState({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: FlutterLogo(
            size: 100,
          ),
        ),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          List<Widget> cardList = [];
          if (snapshot.hasData) {
            for (var i = 0; i < snapshot.data.resource.length; i++) {
              var text = snapshot.data.resource[i].name;
              if (snapshot.data.resource[i].seq == 1) {
                cardList.add(
                  Container(
                    color: Colors.teal,
                    margin: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(text),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.2,
              ),
              children: cardList,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 10,
            ),
          );
        },
      ),
    );
  }
}
