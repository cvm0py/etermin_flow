import 'dart:convert';

import 'package:etermin/models/salon.dart';
import 'package:etermin/widgets/my_appbar_widget.dart';
import 'package:etermin/widgets/salonListing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryExpand extends StatefulWidget {
  const CategoryExpand({ Key ? key }) : super(key: key);

  @override
  _CategoryExpandState createState() => _CategoryExpandState();
}

class _CategoryExpandState extends State<CategoryExpand> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loadSalonData();
  }

  loadSalonData() async {
    await Future.delayed(Duration(seconds: 2));
    final salonJson =
        await rootBundle.loadString("assets/files/salon.json");
    final decodedJson = jsonDecode(salonJson);
    final responseData = decodedJson["responseObject"];
    var salonData = responseData["salons"];
    SalonModel.items = List.from(salonData)
        .map<Salon>((item) => Salon.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,
      appBar: MyAppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                labelText: "Search Services and Salons",
                icon: Icon(Icons.search),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Expanded(
            //   child: (SalonModel.items.isNotEmpty)
            //       ? GridView.builder(
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //             mainAxisSpacing: 10,
            //             crossAxisSpacing: 10,
            //             childAspectRatio: 0.9,
            //           ),
            //           itemCount: SalonModel.items.length,
            //           itemBuilder: (context, index) {
            //             return SalonListingWidget(
            //               item: SalonModel.items[index],
            //             );
            //           }
            //           )
            //       : Center(
            //           child: CircularProgressIndicator(),
            //         ),
            // ),
            SalonListingWidget(),
            SalonListingWidget(),
          ],
        ),
      ),
    );
  }
}