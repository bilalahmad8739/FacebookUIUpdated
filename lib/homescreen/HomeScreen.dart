
import 'package:facebook_ui/Auth/signin.dart';
import 'package:facebook_ui/Auth/utile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Status/Tapbar/Listview/Story.dart';
import 'customewidgets/custompage.dart';
import 'customewidgets/listtile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
FirebaseAuth  auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TabController _tabcontroller = TabController(length: 2, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              width: 390,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80')),

                    Container(
                      height: 33,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  5.0, 0.0, 5.0, 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: "What's on your mind")),
                    ),

                    const Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),

                    //
                  ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: TabBar(
                      labelStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      controller: _tabcontroller,
                      tabs: const [
                        Tab(
                          text: 'Stories',
                        ),
                        Tab(
                          text: 'Reels',
                        )
                      ]),
                ),
                Container(
                  height: 180,
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: _tabcontroller,
                      children: [Story(), Text('Reels')]),
                ),
                customelisttile(),
              const   SizedBox(
                  height: 20,
                ),
                Image.network(
                    'https://img.freepik.com/free-photo/smiling-happy-boy-pointing-fingers-up-copyspace_171337-16394.jpg?w=900&t=st=1667660330~exp=1667660930~hmac=46f3e8294fb062e493e2cfc22c44c5690ce0b32393475900b629fee75ab65442'),
              const   SizedBox(
                  height: 8,
                ),
                customepage()
              ],
            ),
            ElevatedButton(onPressed: (){
              auth.signOut().then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
              }).onError((error, stackTrace) {

                utilse().toastmessage(error.toString());
              });

            }, child: Text('signout'))
          ],
        ),
      ),
    );
  }
}



