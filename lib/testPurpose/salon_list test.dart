import 'package:etermin/widgets/my_appbar_widget.dart';
import 'package:flutter/material.dart';


class Testing extends StatelessWidget {
  const Testing({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbarWidget(),
    body: Text("Nothing"),
    );
    
 
  }
}

