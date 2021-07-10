import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.jpg"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(50),
                //   side: BorderSide(color: Colors.white),
                // ),
                // color: Color(0xFFF5F6F9),
                onPressed: () {},
                child: Image.asset("assets/images/profile.jpeg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}