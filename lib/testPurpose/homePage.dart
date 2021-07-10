import 'package:etermin/widgets/my_appbar_widget.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key ?key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppbarWidget(),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [
            //   Colors.purple[100],
            //   Colors.blue[200],
            //   Colors.red[100],
            // ],
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
            // ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 2, 0),
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            labelText: 'Search Services and Salon',
                            labelStyle: TextStyle(
                              fontSize: 18,
                            ),
                            hintText: 'search',
                            hintStyle: TextStyle(
                              fontSize: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x3E000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(2),
                                bottomRight: Radius.circular(2),
                                topLeft: Radius.circular(2),
                                topRight: Radius.circular(2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x3E000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(2),
                                bottomRight: Radius.circular(2),
                                topLeft: Radius.circular(2),
                                topRight: Radius.circular(2),
                              ),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          ),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 35,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          width: 100,
                          height: 100,
                          // decoration: BoxDecoration(
                          //   color: Color(0xFFEEEEEE),
                          //   borderRadius: BorderRadius.circular(10),
                          //   border: Border.all(
                          //     color: Color(0x3F000000),
                          //     width: 1,
                          //   ),
                          // ),
                          child: Card(
                            elevation: 15,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                  child: Card(
                                    elevation: 4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        "assets/images/beautySalonCate.jpeg",
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 130,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                  child: Text(
                                    'Beauty Salon',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Card(
                            elevation: 15,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                  child: Card(
                                    elevation: 4,
                                    child: Image.asset(
                                      "assets/images/hairSalon.jpeg",
                                      width: MediaQuery.of(context).size.width,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                  child: Text(
                                    'Hair Salon',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Card(
                            elevation: 15,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                  child: Card(
                                    elevation: 4,
                                    child: Image.asset(
                                      "assets/images/nailSalon.jpeg",
                                      width: MediaQuery.of(context).size.width,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                  child: Text(
                                    'Nail Salon',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Card(
                            elevation: 15,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                  child: Card(
                                    elevation: 4,
                                    child: Image.asset(
                                      "assets/images/eyebroSalon.jpeg",
                                      width: MediaQuery.of(context).size.width,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                  child: Text(
                                    'EyeBro & Lashes',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Card(
                            elevation: 15,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                  child: Card(
                                    elevation: 4,
                                    child: Image.asset(
                                      "assets/images/spa.jpeg",
                                      width: MediaQuery.of(context).size.width,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                  child: Text(
                                    'Spa',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Card(
                            elevation: 15,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                  child: Card(
                                    elevation: 4,
                                    child: Image.asset(
                                      "assets/images/groomingSalon.jpeg",
                                      width: MediaQuery.of(context).size.width,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                  child: Text(
                                    'Grooming Salon',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
