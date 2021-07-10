import 'package:flutter/material.dart';

class MyAppbarWidget extends StatelessWidget with PreferredSizeWidget{
  const MyAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
      backgroundColor: Color(0xffF8F8FF),
      title: Container(
        width: 150,
        height: 50,
        child: Image.asset(
          "assets/images/etermin_logo.png",
        ),
      ),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.deepPurple,
          ),
          onPressed: () {
            //todo
          },
        ),
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.deepPurple,
          ),
          onPressed: () {
            //todo
          },
        ),
      ],
    ));
  }

    @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
