//import 'package:etermin/screens/homePage.dart';
import 'package:etermin/widgets/my_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'beautySalonCategory.dart';
import 'petDogOrCat.dart';
//import 'homePage.dart';

class PetOrBeautyWidget extends StatefulWidget {
  const PetOrBeautyWidget({Key? key}) : super(key: key);

  @override
  _PetOrBeautyWidgetState createState() => _PetOrBeautyWidgetState();
}

class _PetOrBeautyWidgetState extends State<PetOrBeautyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                0.1,
                0.9
              ], colors: [
                Color(0xFF9575CD),
                Color(0xffEDE7F6),
              ])
             // color: Color(0xFFFEFEFA),
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
                      width: 360,
                      padding: EdgeInsets.fromLTRB(5, 50, 5, 50),
                      child: Text(
                        '  What are u looking for ?',
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.italic,
                            color: Colors.deepPurple,
                            fontSize: 35),
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
                        elevation: 30,
                        child: Image.asset(
                          'assets/images/petSalon.jpeg',
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
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BeautySalonCategory(),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 30,
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
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Card(
                        color: Colors.deepPurple[100],
                        elevation: 15,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30, 7, 15, 7),
                          width: 150,
                          child: Text(
                            'Pet Salon',
                            style: GoogleFonts.lato(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Card(
                        color: Colors.deepPurple[100],
                        elevation: 15,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30, 7, 15, 7),
                          width: 150,
                          child: Text(
                            'Beauty Salon',
                            style: GoogleFonts.lato(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: 20),
                          ),
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
