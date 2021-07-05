import 'package:etermin/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'petDogOrCat.dart';
import 'homePage.dart';

class PetOrBeautyWidget extends StatefulWidget {
  const PetOrBeautyWidget({Key key}) : super(key: key);

  @override
  _PetOrBeautyWidgetState createState() => _PetOrBeautyWidgetState();
}

class _PetOrBeautyWidgetState extends State<PetOrBeautyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Image.asset(
          "assets/images/etermin_logo.png",
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            onPressed: () {
              //todo
            },
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              //todo
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple[100],
                Colors.blue[200],
                Colors.red[100],
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            color: Color(0xFFEEEEEE),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 150, 5, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple[300],
                            Colors.red[400],
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(5, 50, 5, 50),
                      child: Text(
                        '  What are u looking for ?',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DogOrCatWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      child: Card(
                        elevation: 20,
                        child: Image.asset(
                          'assets/images/petSalon.jpeg',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageWidget(),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 20,
                          child: Image.asset(
                            'assets/images/beautySalon.jpeg',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Card(
                        elevation: 15,
                        child: Container(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'Pet Salon',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                          ),
                          color: Colors.purple[200],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(69, 0, 0, 0),
                      child: Card(
                        elevation: 15,
                        child: Container(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            'Beauty Salon',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                            ),
                          ),
                          color: Colors.purple[200],
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
    );
  }
}
