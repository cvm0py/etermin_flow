import 'package:etermin/models/services.dart';
import 'package:etermin/widgets/item_widget.dart';
import 'package:etermin/widgets/my_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final servicesJson =
        await rootBundle.loadString("assets/files/services.json");
    final decodedJson = jsonDecode(servicesJson);
    final responseData = decodedJson["responseObject"];
    var servicesData = responseData["services"];
    ServicesModel.items = List.from(servicesData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

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
