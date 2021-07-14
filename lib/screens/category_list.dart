import 'dart:convert';

import 'package:etermin/models/salon.dart';
import 'package:etermin/widgets/my_appbar_widget.dart';
import 'package:etermin/widgets/salonListing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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
    //loadSalonData();
  }

  Future<List<dynamic>> futureLoadData() async {
    String pageUrl =
        "http://etermin.cskaa.com:8282/api/customer/search-saloon?service=" +
            widget.pageId;

    var response = await http.get(Uri.parse(pageUrl));
    //print(json.decode(response.body));
    Map<String, dynamic> rr = json.decode(response.body);
    print('-->' + rr['responseObject'].toString());
    List<dynamic> ress = rr['responseObject']['saloons'];
    //print("------>" + ress.length.toString());
    return ress;
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
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
                child: FutureBuilder(
              future: futureLoadData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print('Snapshot ->' + snapshot.data.toString());
                if (snapshot.hasData) {
                  if (snapshot.data.isEmpty) {
                    return Center(
                      child: Text("Sorry, no saloons available!"),
                    );
                  }
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        String _subtitle =
                            snapshot.data[index]['neighbourhood'].toString() +
                                ", " +
                                snapshot.data[index]['city'];
                        String _imageAddress = "http://etermin.cskaa.com:8282" +
                            snapshot.data[index]['logo'];
                        String _gender = "Women";
                        if (snapshot.data[index]['isMen'] &&
                            snapshot.data[index]['isWomen']) {
                          _gender = "Unisex";
                        } else if (snapshot.data[index]['isMen']) {
                          _gender = "Men";
                        } else if (snapshot.data[index]['isMen']) {
                          _gender = "Women";
                        }

                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.353,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.width * 0.55,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(_imageAddress),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.grey[100],
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          snapshot.data[index]['name'],
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.deepPurple[600],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          _subtitle,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.deepPurple[400],
                                          ),
                                        ),
                                      ],
                                    ),
                                    _buildChip(_gender, Color(0xFF9575CD)),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey[300],
                                height: 10,
                                thickness: 1,
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.deepPurple),
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
