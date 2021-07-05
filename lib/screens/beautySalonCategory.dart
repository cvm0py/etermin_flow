import 'package:etermin/models/services.dart';
import 'package:etermin/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class BeautySalonCategory extends StatefulWidget {
  BeautySalonCategory({Key key}) : super(key: key);

  @override
  _BeautySalonCategory createState() => _BeautySalonCategory();
}

class _BeautySalonCategory extends State<BeautySalonCategory> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loadData();
    textController = TextEditingController();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final serviceJson =
        await rootBundle.loadString("assets/files/services.json");
    final decodedJson = jsonDecode(serviceJson);
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
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Container(
          width: 150,
          height: 50,
          child: Image.asset(
            "assets/images/eter_logo.png",
          ),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              //todo
            },
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              //todo
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: (ServicesModel.items!=null && ServicesModel.items.isNotEmpty
        ) ? GridView.builder(
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
            }) : Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
