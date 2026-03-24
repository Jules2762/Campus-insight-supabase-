import 'package:flutter/material.dart';

class ActuHomeCard extends StatelessWidget {
  const ActuHomeCard({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Actualité du jour',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Actualité du jour',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
