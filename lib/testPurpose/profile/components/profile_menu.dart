import 'package:flutter/material.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key ?key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
      
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          // color: Color(0xFFF5F6F9),
        child: TextButton(
          onPressed: press,
          child: Row(
            children: [
              Image.asset("assets/images/beautySalon.jpeg",
            
                color: Colors.deepPurple,
                width: 22,
              ),
              SizedBox(width: 20),
              Expanded(child: Text(text)),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}