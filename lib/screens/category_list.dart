import 'dart:convert';
import 'package:etermin/models/salon.dart';
import 'package:etermin/widgets/my_appbar_widget.dart';
import 'package:etermin/widgets/salonListing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryExpand extends StatefulWidget {
  final String pageId;
  const CategoryExpand({Key? key, required this.pageId}) : super(key: key);

  @override
  _CategoryExpandState createState() => _CategoryExpandState();
}

class _CategoryExpandState extends State<CategoryExpand> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  void initState() {
    super.initState();
    String _pageUrl = "http://etermin.cskaa.com:8282/api/customer/search-saloon?service=" ;
    loadSalonData();
  }

  loadSalonData() async {
    await Future.delayed(Duration(seconds: 2));
    final salonJson = await rootBundle.loadString("assets/files/salon.json");
    final decodedJson = jsonDecode(salonJson);
    final responseData = decodedJson["responseObject"];
    var salonData = responseData["saloons"];
    SalonModel.grp = List.from(salonData)
        .map<Salon>((salon) => Salon.fromMap(salon))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Expanded(
              child: (SalonModel.grp.isNotEmpty)
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: SalonModel.grp.length,
                      itemBuilder: (context, index) {
                        return SalonListingWidget(
                          salon: SalonModel.grp[index],
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
