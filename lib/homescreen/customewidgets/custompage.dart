import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class customepage extends StatelessWidget {
  const customepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
      
         SizedBox(width: 5,),
         CircleAvatar(radius: 15,
          child: Icon(Icons.thumb_up,size: 15,),),
          
          Text('Like'),
          Padding(
            padding: EdgeInsets.only(left: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.chat,
                ),
                 SizedBox(width: 5,),
                Text('comment'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 43),
            child: Row(
              children: const  [
                Icon(Icons.offline_share),
                SizedBox(width: 5,),
                Text('Share'),
              ],
            ),
          )
    
          //
        ],
      ),
    );
  }
}