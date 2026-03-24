import 'package:flutter/material.dart';
import 'package:projet_m2/features/widgets/actu_home_card.dart';
import 'package:projet_m2/features/widgets/doc_home_card.dart';
import 'package:projet_m2/features/widgets/main_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      body: Column(
        spacing: 20,
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            transformAlignment: AlignmentGeometry.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.school, color: Colors.white, size: 30),
                ),
                SizedBox(height: 10),
                Text(
                  'Bienvenue sur votre espace étudiant',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                // SizedBox(height: 5),
                Text(
                  'Gérez vos cours, notes et actualités en un seul endroit.',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          HomeSectionContainer(
            title: 'Actualités et Annonces',
            child: SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      ActuHomeCard(),
                      SizedBox(width: 10),
                      ActuHomeCard(),
                      SizedBox(width: 10),
                      ActuHomeCard(),
                    ],
                  ),
                ],
              ),
            ),
          ),

          HomeSectionContainer(
            title: 'Documents importants',
            child: SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    spacing: 10,
                    children: [DocHomeCard(), DocHomeCard(), DocHomeCard()],
                  ),
                ],
              ),
            ),
          ),
          HomeSectionContainer(
            title: 'Messagerie administrative',
            child: SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 300,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mail_outline,
                              size: 40,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Aucun message administratif pour le moment.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSectionContainer extends StatelessWidget {
  final String title;
  final Widget child;
  const HomeSectionContainer({
    super.key,
    required this.title,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Action pour voir plus
              },
              child: Text('Voir plus', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        SizedBox(height: 10),
        child,
      ],
    );
  }
}
