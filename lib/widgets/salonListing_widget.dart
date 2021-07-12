import 'package:etermin/models/salon.dart';
import 'package:flutter/material.dart';

//todo
class SalonListingWidget extends StatelessWidget {
  final Salon salon;
  const SalonListingWidget({Key? key, required this.salon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _subtitle = salon.neighbourhood + " " + salon.city;
    String _imageAddress = "http://etermin.cskaa.com:8282" + salon.logo;
    String _gender = "Women";
    if (salon.isMen && salon.isWomen) {
      _gender = "Unisex";
    } else if (salon.isMen) {
      _gender = "Men";
    } else if (salon.isWomen) {
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
            height: MediaQuery.of(context).size.width * 0.55,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      salon.name,
                      style: TextStyle(
                        fontSize: 30,
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
                        fontSize: 20,
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
}
