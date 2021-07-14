import 'package:etermin/models/services.dart';
import 'package:etermin/screens/category_list.dart';
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
    //loadData();
    futureLoadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var response = await http.get(Uri.parse(
        "http://etermin.cskaa.com:8282/api/customer/services?category=beauty"));
    //print('>' + response.body.toString());
    var decodedJson = json.decode(response.body);
    //print("--> " + decodedJson.toString());
    var responseData = decodedJson["responseObject"];

    var servicesData = responseData["services"];
    print("------" + servicesData);

    setState(() {});
  }

  Future<List<dynamic>> futureLoadData() async {
    var response = await http.get(Uri.parse(
        "http://etermin.cskaa.com:8282/api/customer/services?category=beauty"));
    //print(json.decode(response.body));
    Map<String, dynamic> rr = json.decode(response.body);
    //print('-->' + rr['responseObject']['services'].toString());
    List<dynamic> ress = rr['responseObject']['services'];
    //print("------>" + ress.length.toString());
    return ress;
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
                child: FutureBuilder<List<dynamic>>(
                    future: futureLoadData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      //print('Snapshot ->' + snapshot.data.length.toString());
                      if (snapshot.hasData) {
                        print('Snapshot ->' + snapshot.data.toString());
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.9,
                            ),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              String _imageUrl =
                                  "http://etermin.cskaa.com:8282" +
                                      snapshot.data[index]['logo'];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CategoryExpand(
                                                pageId: snapshot.data[index]
                                                        ['id']
                                                    .toString(),
                                              )));
                                },
                                child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Image.network(
                                          _imageUrl,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Center(
                                            child: Text(
                                              snapshot.data[index]['name'],
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepPurple,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Center(
                                            child: Text(
                                              snapshot.data[index]
                                                  ['description'],
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
