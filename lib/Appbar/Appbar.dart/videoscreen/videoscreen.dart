import 'package:facebook_ui/Appbar/Appbar.dart/videoscreen/foryou.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class videoscreen extends StatelessWidget {
  const videoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 5,
      child: Scaffold(appBar: AppBar(actions: const  [
        CircleAvatar(backgroundColor: Colors.grey,
          child: Icon(Icons.person,color: Colors.black,),),
          SizedBox(width: 10,),
          CircleAvatar(backgroundColor: Colors.grey,
          child: Icon(Icons.search,color: Colors.black,),)

      ],
        title: const Text('Watch',style: TextStyle(color: Colors.black,fontSize: 30),),
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        bottom: TabBar(indicator: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color.fromARGB(255, 172, 175, 176)),
          unselectedLabelColor: Colors.black,unselectedLabelStyle: TextStyle(fontSize: 18),
        labelColor: Colors.blue,
          tabs: const  [
        Tab(text: 'For You',),
        Tab(text: 'Live',),
        Tab(text: 'Gaming',),
        Tab(text: 'Following',),
        Tab(text: 'Save',),
       
        


      ]),),body: const TabBarView(children: [
      foryou(),
        Text('Live'),
        Text('Gaming'),
        Text('Following'),
        Text('Save'),
        
      ]),)

    );
  }
}