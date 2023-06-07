

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class firestores extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final firstore = FirebaseFirestore.instance.collection('detail').snapshots();

  final name = TextEditingController();
  final address = TextEditingController();
  final formkey = GlobalKey<FormState>();

  firestores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore'),
      ),
      body: Column(
        children: [
          const Text(
            'Form',
            style: TextStyle(fontSize: 25),
          ),
          Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter name';
                      } else {
                        null;
                      }
                    },
                    controller: name,
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter address';
                      } else {
                        return null;
                      }
                    },
                    controller: address,
                    decoration: InputDecoration(hintText: 'address'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) ;

                      adddata();
                    },
                    child: Text('submit'),
                  )
                ],
              )),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: firstore,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) 
                    {
                  if (snapshot.connectionState == ConnectionState.waiting) 
          
                    return CircularProgressIndicator();
                  
                  if(snapshot.hasError)
                  {
                    return Text('some Error');
                  }
                  return 
                  ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
          
                    return ListTile(
                      title: Text(snapshot.data!.docs[index]['name'].toString(),style: TextStyle(fontSize: 20),),
                         subtitle: Text(snapshot.data!.docs[index]['address'].toString(),style: TextStyle(fontSize: 20) ,),
                    );
                    
                  }));
          
                  //  else if (snapshot.connectionState == ConnectionState.active ||
                  //     snapshot.connectionState == ConnectionState.done)
                  //      {
                  //   if (snapshot.hasData) {
                  //     return ListView.builder(
                  //         itemBuilder: (BuildContext context, index) {
                  //           return ListTile(
                  //             title: Text(snapshot.data!.docs[index]['name'].id.toString()),
          
                  //           );
                  //         });
                  //   } 
                  //   else if (snapshot.hasError) {
                  //     return Text('some error');
                  //   } 
                  //   else {
                  //     Text('not show');
                  //   }
                  // }
                // else
                // {
                //    Text('data');
                // }
            }),
          ),
        ],
      ),
    );
  }

  Future adddata() async {
    await firestore.collection('detail').add(
        {'name': name.text.toString(), 'address': address.text.toString()});
  }
}
