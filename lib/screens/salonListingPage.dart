import 'package:flutter/material.dart';

class SalonListingPage extends StatefulWidget {
  @override
  _SalonListingPageState createState() => _SalonListingPageState();
}

class _SalonListingPageState extends State<SalonListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Beauty Salons",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.deepPurple),
                ),
                IconButton(
                    icon: Icon(
                      Icons.filter,
                      color: Colors.deepPurple,
                    ),
                    color: Colors.deepPurple,
                    onPressed: null),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "City",
                    labelText: "Enter City",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "City cannot be empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Select Service",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Service cannot be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                Material(
                  color: Colors.deepPurple,
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(maxHeight: 400),
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Container(
                width: 1000,
                height: 400,
                child: Card(
                  elevation: 15,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Card(
                          elevation: 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "assets/images/beautySalonCate.jpeg",
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 32.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "New Hair Bloom Salon",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Some dummy text as a description or a catchy line",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
            ],
          ),
          
        ],
      ),
    );
  }
}
