import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CustomDrawerItem> items = [
      const CustomDrawerItem(title: "Accueil", icon: Icons.home, page: '/'),
      const CustomDrawerItem(
        title: "Actualités",
        icon: Icons.receipt_long,
        page: '/orders',
      ),
      const CustomDrawerItem(
        title: "Annonces",
        icon: Icons.account_balance_wallet,
        page: '/transactions',
      ),
      const CustomDrawerItem(
        title: "Settings",
        icon: Icons.settings,
        page: '/settings',
      ),
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF0D47A1)
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    "Campus Insight",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            )
          ),

          ...items.map((item) {
            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              onTap: () {
                Navigator.pop(context); // ferme le drawer

                if (item.page != null) {
                  Navigator.pushNamed(context, item.page!);
                }
              },
            );
          }),
        ],
      ),
    );
  }
}

class CustomDrawerItem {
  final String title;
  final IconData icon;
  final String? page;

  const CustomDrawerItem({required this.title, required this.icon, this.page});
}
