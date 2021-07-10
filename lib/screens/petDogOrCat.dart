import 'package:etermin/widgets/my_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DogOrCatWidget extends StatefulWidget {
  @override
  _DogOrCatWidgetState createState() => _DogOrCatWidgetState();
}

class _DogOrCatWidgetState extends State<DogOrCatWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var colors2 = [
                    Color(0xffEDE7F6),
                    Color(0xff9575CD),
                  ];
        return Scaffold(
          key: scaffoldKey,
          appBar: MyAppbarWidget(),
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                    0.1,
                    0.9
                  ], colors: colors2)),
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
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(5, 50, 5, 50),
                      width: 360,
                      child: Center(
                        child: Text(
                          "Pet Salon",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.italic,
                              color: Colors.deepPurple,
                              fontSize: 35),
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
                        // await Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DogOrCatWidget(),
                        //   ),
                        //   (r) => false,
                        // );
                      },
                      child: Card(
                        elevation: 30,
                        child: Image.asset(
                          'assets/images/dog.jpeg',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          // await Navigator.push(
                          //   context,
                          //   // MaterialPageRoute(
                          //   //  // builder: (context) => PetCategory(),
                          //   // ),
                          // );
                        },
                        child: Card(
                          elevation: 30,
                          child: Image.asset(
                            'assets/images/cat.jpeg',
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
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Card(
                        elevation: 15,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          width: 150,
                          child: Center(
                            child: Text(
                              'Cat',
                              style: GoogleFonts.lato(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.deepPurple[400],
                                  fontSize: 20),
                            ),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Card(
                        elevation: 15,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          width: 150,
                          child: Center(
                            child: Text(
                              'Dog',
                              style: GoogleFonts.lato(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.deepPurple[400],
                                  fontSize: 20),
                            ),
                          ),
                          color: Colors.white,
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
