import 'package:flutter/material.dart';
//todo
class ExamplesWidget extends StatefulWidget {
  @override
  _ExamplesWidgetState createState() => _ExamplesWidgetState();
}

class _ExamplesWidgetState extends State<ExamplesWidget> {
  @override
  Widget build(BuildContext context) => ListView(
        children: [
          Container(
            clipBehavior: Clip.none,
            padding: EdgeInsets.all(32),
            child: buildProfile(),
          ),
        ],
      );

  Widget buildProfile() {
    final urlProfile =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80';

    return Column(
      children: [
        Stack(
          children: [
            Container(color: Colors.orange, height: 120),
            Positioned(
              bottom: -20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(color: Colors.white, spreadRadius: 4),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(urlProfile),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
