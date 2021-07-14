import 'dart:convert';

import 'package:etermin/models/services.dart';
import 'package:etermin/screens/category_list.dart';
import 'package:etermin/widgets/salonListing_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemWidget extends StatelessWidget {
  final dynamic item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  Future<List<dynamic>> futureLoadData() async {
    String _imageUrl = "http://etermin.cskaa.com:8282" + item.image;
    var response = await http.get(Uri.parse(_imageUrl));
    //print(json.decode(response.body));
    Map<String, dynamic> rr = json.decode(response.body);
    print('-->' + rr['responseObject'].toString());
    List<dynamic> ress = rr['responseObject']['saloons'];
    //print("------>" + ress.length.toString());
    return ress;
  }

  @override
  Widget build(BuildContext context) {
    print('Image -> ' + item.image);
    String _imageUrl = "http://etermin.cskaa.com:8282" + item.image;
    String pageId = item.id.toString();
    return FutureBuilder(
      future: futureLoadData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('SNAP --> ' + snapshot.data.toString());
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryExpand(
                            pageId: pageId,
                          )));
            },
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                      _imageUrl,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.3,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ),
          );
        }
      },
    );
  }
}
