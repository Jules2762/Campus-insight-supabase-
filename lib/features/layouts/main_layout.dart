import 'package:flutter/material.dart';
import 'package:projet_m2/cores/states/student_stats_state.dart';

import 'package:projet_m2/cores/themes/theme_color.dart';
import 'package:projet_m2/features/pages/home_page.dart';
import 'package:projet_m2/features/pages/profile_page.dart';
import 'package:projet_m2/features/pages/stats_page.dart';
import 'package:projet_m2/features/pages/student_page.dart';
import 'package:projet_m2/features/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';


class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  final List<Widget> _body = [
    HomePage(),
    StudentPage(),
    StatsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(color: ThemeColor.surface),
        child: IndexedStack(index: _currentIndex, children: _body),
      ),
      appBar: MyAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColor.primary,

        onPressed: () {
          // Handle FAB press
          Navigator.pushNamed(context, '/add-student');
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: ThemeColor.primary,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Future.microtask((){
            //   if(!mounted) return;
            //   // ignore: use_build_context_synchronously

            //   if(index==1)context.read<StudentStatsState>().fetchData();
            // });
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            activeIcon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.menu, color: Colors.white),
      ),
      title: Text('Campus Insight', style: TextStyle(color: Colors.white)),
      centerTitle: true,

      actions: [
        IconButton(
          icon: Badge(
            label: Text('3', style: TextStyle(fontSize: 10)),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
          onPressed: () {
            // Handle notification icon press
          },
        ),
      ],
      backgroundColor: ThemeColor.primary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
