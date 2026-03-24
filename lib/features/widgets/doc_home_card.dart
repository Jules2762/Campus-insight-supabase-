import 'package:flutter/material.dart';
import 'package:projet_m2/cores/themes/theme_color.dart';

class DocHomeCard extends StatelessWidget {
  const DocHomeCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 250,
      // height: 170,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.calendar_month, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                tooltip: 'Télécharger',
                icon: Icon(Icons.download_outlined, color: Colors.blueGrey),
              ),
            ],
          ),
          // SizedBox(height: 10),
          Text(
            'Emploi du Temps',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 5),
          Text(
            'PDF. 2.5Mo. 12/09/2024',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(ThemeColor.primary.withValues(  alpha:0.1)),
              minimumSize: WidgetStateProperty.all(Size(280, 40)),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Visualiser',
              style: TextStyle(color: ThemeColor.primary),
            ),
          ),
        ],
      ),
    );
  }
}
