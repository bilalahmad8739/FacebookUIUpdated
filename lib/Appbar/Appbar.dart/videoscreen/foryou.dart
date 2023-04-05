import 'package:facebook_ui/homescreen/customewidgets/custompage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class foryou extends StatelessWidget {
  const foryou({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.blue,backgroundImage: NetworkImage('https://images.unsplash.com/photo-1548449112-96a38a643324?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),),
            title: Row(
              children: const  [
                Text('Cricket page'),
                SizedBox(width: 10,),
                
                Text('Follow',style: TextStyle(color: Colors.blue),),
                
              ],
            ),
            trailing: Icon(Icons.more_horiz),
            subtitle: Text('28 Oct 2022'),


          ),
          Image.network('https://upload.wikimedia.org/wikipedia/commons/7/7a/Pollock_to_Hussey.jpg'),
          customepage(),
          customepage(),
          

        ],
      ),
    );
  }
}