//todo
//import 'package:etermin/widgets/profile_widget.dart';

import 'package:etermin/widgets/my_appbar_widget.dart';
import 'package:flutter/material.dart';
//import 'components/body.dart';

class Profile extends StatelessWidget {
  const Profile({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                 width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    
                      image: ExactAssetImage(
                          'assets/images/profile.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              TextFormField(
                        obscureText: true,
                        
                       style: TextStyle(),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
