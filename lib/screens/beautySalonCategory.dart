import 'package:etermin/models/services.dart';
import 'package:etermin/widgets/item_widget.dart';
import 'package:etermin/widgets/my_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class BeautySalonCategory extends StatefulWidget {
  BeautySalonCategory({Key? key}) : super(key: key);

  @override
  _BeautySalonCategory createState() => _BeautySalonCategory();
}

class _BeautySalonCategory extends State<BeautySalonCategory> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var response = await http.get(Uri.parse(
        "http://etermin.cskaa.com:8282/api/customer/services?category=beauty"));
    print('>' + response.body.toString());
    final decodedJson = json.decode(response.toString());
    print("--> " + decodedJson);
    var responseData = decodedJson["responseObject"];

    var servicesData = responseData["services"];
    print("------"+servicesData.toString());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MyAppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
              child: (ServicesModel.items.isNotEmpty)
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: ServicesModel.items.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(
                          item: ServicesModel.items[index],
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
