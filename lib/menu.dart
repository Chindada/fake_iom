import 'package:flutter/material.dart';
import 'package:fake_iom/api.dart';
import 'package:fake_iom/schedule.dart';

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
                List<Shadow> sha = [];
                sha.add(Shadow(color: Colors.white, offset: Offset(2, 2)));
                cardList.add(
                  RaisedButton(
                    // elevation: 3.3,
                    // padding: EdgeInsets.all(40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    color: Colors.teal,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SchedulePage();
                      }));
                    },
                    child: Container(
                      color: Colors.teal,
                      margin: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 35,
                            shadows: sha,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            }
            return Container(
              margin: EdgeInsets.all(20),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: cardList,
              ),
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
