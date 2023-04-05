
import 'package:facebook_ui/Appbar/Appbar.dart/videoscreen/videoscreen.dart';
import 'package:flutter/material.dart';

import '../../homescreen/HomeScreen.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: const  Icon(
              Icons.menu,
              color: Colors.black,
            ),
            title: const  Text(
              'facebook',
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
            actions: [
              CircleAvatar(
                child: Icon(Icons.search),
                backgroundColor: Colors.grey[300],
                radius: 14,
              ),
              const SizedBox(
                width: 7,
              ),
              CircleAvatar(
                child: Icon(Icons.message_rounded),
                backgroundColor: Colors.grey[300],
                radius: 14,
              ),
            ],
            bottom:  TabBar(
              
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabs: [
                  Tab(
                    icon: customicon(icon: Icons.home)
                  ),
                  Tab(
                    icon: customicon(icon: Icons.slideshow)
                  ),
                  Tab(
                    icon: customicon(icon:Icons.today),
                  ),
                  Tab(
                    icon: customicon(icon: Icons.camera_alt)
                  ),
                  Tab(
                    icon: customicon(icon: Icons.notifications)
                  ),
                  Tab(
                    icon: customicon(icon: Icons.menu)
                  )
                ]),
          ),
          body: const TabBarView(children: [
            HomeScreen(),

           videoscreen(),
            Text('Music'),
            // Story(),
            Text('Camra'),
            Text('Notification'),
            Text('Menu'),
          ]),
        ),
      ),
    );
  }
}

class customicon extends StatelessWidget {
  final IconData icon;
   customicon({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(icon,size: 30,);
  }
}
